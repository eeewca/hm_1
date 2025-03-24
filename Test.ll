; ModuleID = 'Test.c'
source_filename = "Test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@major_mul = dso_local global i32 1000000, align 4
@grade_mul = dso_local global i32 10000, align 4
@class_mul = dso_local global i32 100, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@MajorCode = dso_local global [1 x i32] zeroinitializer, align 4
@Grade = dso_local global [1 x i32] zeroinitializer, align 4
@Class = dso_local global [1 x i32] zeroinitializer, align 4
@ClassNumber = dso_local global [1 x i32] zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @StudentNumber(i32* noundef %0, i32* noundef %1, i32* noundef %2, i32* noundef %3) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  %14 = load i32*, i32** %5, align 8
  %15 = getelementptr inbounds i32, i32* %14, i64 0
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %9, align 4
  %17 = load i32*, i32** %6, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 0
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %10, align 4
  %20 = load i32*, i32** %7, align 8
  %21 = getelementptr inbounds i32, i32* %20, i64 0
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %11, align 4
  %23 = load i32*, i32** %8, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 0
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %12, align 4
  %26 = load i32, i32* %9, align 4
  %27 = load i32, i32* @major_mul, align 4
  %28 = mul nsw i32 %26, %27
  %29 = load i32, i32* %10, align 4
  %30 = load i32, i32* @grade_mul, align 4
  %31 = mul nsw i32 %29, %30
  %32 = add nsw i32 %28, %31
  %33 = load i32, i32* %11, align 4
  %34 = load i32, i32* @class_mul, align 4
  %35 = mul nsw i32 %33, %34
  %36 = add nsw i32 %32, %35
  %37 = load i32, i32* %12, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, i32* %13, align 4
  %39 = load i32, i32* %13, align 4
  %40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %39)
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1033, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @MajorCode, i64 0, i64 0), align 4
  store i32 22, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @Grade, i64 0, i64 0), align 4
  store i32 3, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @Class, i64 0, i64 0), align 4
  store i32 27, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @ClassNumber, i64 0, i64 0), align 4
  call void @StudentNumber(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @MajorCode, i64 0, i64 0), i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @Grade, i64 0, i64 0), i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @Class, i64 0, i64 0), i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @ClassNumber, i64 0, i64 0))
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
