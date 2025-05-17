## Pre-lab  实验前

- [Lab 2 Setup  实验室 2 设置](https://sp21.datastructur.es/materials/lab/lab2setup/lab2setup)
- Run `git pull skeleton master` in your repo. You should get a `lab2/` folder.  
    在你的仓库中运行 `git pull skeleton master` 。你应该会得到一个 `lab2/` 文件夹。

## Introduction  介绍

In this lab, you will learn about how to use the IntelliJ debugger and how to use JUnit tests in IntelliJ.  
在本实验中，您将了解如何使用 IntelliJ 调试器以及如何在 IntelliJ 中使用 JUnit 测试。

## Debugger Basics  调试器基础知识

Repeat the “Project Setup” process from lab 2 setup. However, this time, you should “open or import” the `lab2/pom.xml` file instead of the `lab2setup/pom.xml` file.  
重复实验 2 设置中的“项目设置”过程。不过，这次你应该“打开或导入” `lab2/pom.xml` 文件，而不是 `lab2setup/pom.xml` 文件。

After importing, your IntelliJ should look something like the following:  
导入后，您的 IntelliJ 应该如下所示：![folder structure](https://sp21.datastructur.es/materials/lab/lab2/img2/folder_structure.png)

### Breakpoints and Step Into  
断点和单步执行

We’ll start by running the main method in `DebugExercise1`. Open up this file in IntelliJ and click the run button. You should see three statements printed to the console, one of which should strike you as incorrect. If you’re not sure how to run `DebugExercise1`, right click on it in the list of files and click the `Run DebugExercise1.main` button as shown below:  
我们首先运行 `DebugExercise1` 中的 main 方法。在 IntelliJ 中打开此文件，然后单击“运行”按钮。您应该会看到控制台打印出三条语句，其中一条语句可能看起来不正确。如果您不确定如何运行 `DebugExercise1` ，请在文件列表中右键单击该文件，然后单击 `Run DebugExercise1.main` 按钮，如下所示：![run button](https://sp21.datastructur.es/materials/lab/lab2/img2/run_button.png)

Somewhere in our code there is a bug, but don’t go carefully reading the code for it! While you might be able to spot this particular bug, often bugs are nearly impossible to see without actually trying to run the code and probe what’s going on as it executes.  
我们的代码中某个地方有 bug，但不要仔细阅读它的代码！虽然你或许能够发现这个特定的 bug，但通常情况下，如果不实际尝试运行代码并探究其执行过程中发生的情况，几乎不可能发现 bug。

Many of you have had lots of experience with using print statements to probe what a program is thinking as it runs. While print statements can be very useful for debugging, they have a few disadvantages:  
你们中的许多人都有过使用打印语句来探测程序运行时的想法的经验。虽然打印语句对于调试非常有用，但它们也有一些缺点：

1. They require you to modify your code (to add print statements).  
    它们要求您修改代码（添加打印语句）。
2. They require you to explicitly state what you want to know (since you have to say precisely what you want to print).  
    它们要求您明确说明您想知道的内容（因为您必须准确地说出您想要打印的内容）。
3. And they provide their results in a format that can be hard to read, since it’s just a big blob of text in the execution window.  
    而且他们提供的结果格式很难阅读，因为它只是执行窗口中的一大段文本。

Often (but not always) it takes less time and mental effort to find a bug if you use a debugger. The IntelliJ debugger allows you to pause the code in the middle of execution, step the code line by line, and even visualize the organization of complex data structures like linked lists.  
通常（但并非总是如此），使用调试器可以减少查找错误所需的时间和精力。IntelliJ 调试器允许您在执行过程中暂停代码、逐行执行代码，甚至可视化复杂数据结构（例如链表）的组织方式。

While they are powerful, debuggers have to be used properly to gain any advantage. We encourage you to do what one might call “scientific debugging”, that is, debugging by using something quite similar to the scientific method!  
调试器虽然功能强大，但必须正确使用才能发挥其优势。我们鼓励您进行所谓的“科学调试”，即使用与科学方法非常类似的方法进行调试！

Generally speaking, you should formulate hypotheses about how segments of your code should behave, and then use the debugger to resolve whether those hypotheses are true. With each new piece of evidence, you will refine your hypotheses, until finally, you cannot help but stumble right into the bug.  
一般来说，你应该对代码片段的行为方式提出假设，然后使用调试器来判断这些假设是否成立。随着每一条新证据的出现，你都会不断完善你的假设，直到最终你不得不直面错误。

Our first exercise introduces us to two of our core tools, the `breakpoint` and the `step over` button. In the left-hand Project view, right click (or two finger click) on the `DebugExercise1` file and this time select the `Debug` option rather than the `Run` option. If the Debug option doesn’t appear, it’s because you didn’t properly import your `lab2` project (see the instructions in `lab2setup`).  
我们的第一个练习向我们介绍了两个核心工具， `breakpoint` 和 `step over` 按钮。在左侧项目视图中，右键单击（或双指单击） `DebugExercise1` 文件，这次选择 `Debug` 选项而不是 `Run` 选项。如果没有出现“调试”选项，那是因为你没有正确导入 `lab2` 项目（请参阅 `lab2setup` 中的说明）。![folder structure](https://sp21.datastructur.es/materials/lab/lab2/img2/debug_button.png)

You’ll see that the program simply runs again, with no apparent difference! That’s because we haven’t give the debugger anything interesting to do. Let’s fix that by “setting a breakpoint”. To do so, scroll to the line that says `int t3 = 3;`, then click just to the right of the line number. You should see a red dot appear that vaguely resembles a stop sign, which means we have now set a breakpoint. If we run the program in debug mode again it’ll stop at that line. If you’d prefer to avoid right-clicking to run your program again, you can click the bug icon in the top right of the screen instead. An animated gif showing off the steps in this paragraph (from a previous semester) is available [at this link](https://gfycat.com/ThickBarrenFrogmouth).  
你会发现程序又运行了，没有任何明显的区别！那是因为我们没有给调试器设置任何有用的功能。让我们通过“设置断点”来解决这个问题。为此，滚动到写着 `int t3 = 3;` 的行，然后点击行号右侧。你应该会看到一个红点，形状有点像停止符号，这意味着我们现在设置了一个断点。如果我们再次以调试模式运行程序，它会停在那一行。如果你不想右键单击再次运行程序，你可以点击屏幕右上角的 bug 图标。 [此链接](https://gfycat.com/ThickBarrenFrogmouth)提供了一个 gif 动图，展示了本段中的步骤（来自上学期）。

![breakpoint](https://sp21.datastructur.es/materials/lab/lab2/img2/breakpoint.png)

If the text console (that says things like “round(10/2)”) does not appear when you click the debug button, you may need to perform one additional step before proceeding. At the top left of the information window in the bottom panel, you should see tabs labeled “Debugger” and “Console” (and “Java Visualizer”). Click and drag the “Console” window to the far right of the bottom panel. This will allow you to show both the debugger and the console at the same time. An animated gif showing off this process (from a previous semester) is available [at this link](https://gfycat.com/SmugAbleAustraliankelpie).  
如果点击“调试”按钮后文本控制台（例如“round(10/2)”）没有出现，则可能需要执行一个额外步骤才能继续。在底部面板信息窗口的左上角，您应该会看到标有“调试器”和“控制台”（以及“Java 可视化工具”）的选项卡。点击“控制台”窗口并将其拖动到底部面板的最右侧。这样您就可以同时显示调试器和控制台。 [此链接](https://gfycat.com/SmugAbleAustraliankelpie)提供了一个展示此过程的动图（来自上学期）。

Once you’ve clicked the debug button (and made your console window visible if necessary), you should see that the program has paused at the line at which you set a breakpoint, and you should also see a list of all the variables at the bottom, including `t`, `b`, `result`, `t2`, `b2`, and `result2`. We can advance the program one step by clicking on the “step into” button, which is an arrow that points down as shown on the next line:  
单击“调试”按钮后（并在必要时显示控制台窗口），您应该看到程序在设置断点的行上暂停，并且还应该在底部看到所有变量的列表，包括 `t` ， `b` ， `result` ， `t2` ， `b2` 和 `result2` 。我们可以通过单击“单步执行”按钮使程序前进一步，该按钮是一个向下的箭头，如下一行所示：

![step_into](https://sp21.datastructur.es/materials/lab/lab2/img2/step_into.png)

We’ll discuss the other buttons later in this lab. **Make sure you’re pressing ‘step into’ rather than ‘step over’.** Step-into points straight down, whereas step-over points up to the right and then down to the right.  
我们将在本实验的稍后部分讨论其他按钮。 **请确保您按下的是“步入”而不是“跨过”。** “步入”按钮指向垂直下方，而“跨过”按钮指向右上方，然后向右下方。

Each time you click this button, the program will advance one step. **Before you click each time, formulate a hypothesis about how the variables should change.**  
每次点击此按钮，程序都会前进一步。 **每次点击之前，请先制定一个关于变量应该如何变化的假设。**

Note that the currently highlighted line is the line _that is about to execute_, not the line that has just executed.  
注意，当前高亮的行是_即将执行的_行，而不是刚刚执行的行。

Repeat this process until you find a line where the result does not match your expectations or the expectations of the person who wrote the code. Try and figure out why the line doesn’t do what you expect. If you miss the bug the first time, click the stop button (red square), and then the debug button to start back over. Optionally, you may fix the bug once you’ve found it.  
重复此过程，直到找到结果不符合您或代码编写者预期的行。尝试找出该行未按预期运行的原因。如果您第一次没有注意到错误，请点击停止按钮（红色方块），然后点击调试按钮重新开始。您也可以选择在找到错误后立即修复它。

### Step Over and Step Out  
跳过和跳出

Just as we rely on layering abstractions to construct and compose programs, we should also rely on abstraction to debug our programs. The “step over” button in IntelliJ makes this possible. Whereas the “step into” from the previous exercise shows the literal next step of the program, the “step over” button allows us to complete a function call without showing the function executing.  
正如我们依赖分层抽象来构建和编写程序一样，我们也应该依赖抽象来调试程序。IntelliJ 中的“step over”按钮使这成为可能。上一个练习中的“step into”按钮显示程序的字面下一步，而“step over”按钮允许我们在不显示函数执行过程的情况下完成函数调用。

The main method in `DebugExercise2` is supposed to take two arrays, compute the element-wise max of those two arrays, and then sum the resulting maxes. For example, suppose the two arrays are `{2, 0, 10, 14}` and `{-5, 5, 20, 30}`. The element-wise max is `{2, 5, 20, 30}`, e.g. in the second position, the larger of “0” and “5” is 5. The sum of this element-wise max is 2 + 5 + 20 + 30 = 57.  
`DebugExercise2` 中的主方法应该接收两个数组，计算这两个数组的逐元素最大值，然后对得到的最大值求和。例如，假设这两个数组分别为 `{2, 0, 10, 14}` 和 `{-5, 5, 20, 30}` 。逐元素最大值为 `{2, 5, 20, 30}` ，例如在第二个位置，“0” 和 “5” 中较大的那个是 5。这个逐元素最大值的和为 2 + 5 + 20 + 30 = 57。

There are two different bugs in the provided code. Your job for this exercise is to fix the two bugs, with one special rule: **You should NOT step into the `max` or `add` functions or even try to understand them.** These are very strange functions that use syntax (and bad style) to do easy tasks in an incredibly obtuse way. If you find yourself accidentally stepping into one of these two functions, use the “step out” button (an upwards pointing arrow) to escape.  
提供的代码中有两个不同的错误。在本练习中，你的任务是修复这两个错误，但有一个特殊规则： **你不应该单步执行 `max` 函数，也不应该 `add` 函数，甚至不应该尝试理解它们。** 这些函数非常奇怪，它们使用语法（以及糟糕的代码风格）以一种极其晦涩难懂的方式完成简单的任务。如果你发现自己不小心单步执行了这两个函数中的一个，请使用“单步执行”按钮（一个向上的箭头）退出。

Even without stepping INTO these functions, you should be able to tell whether they have a bug or not. That’s the glory of abstraction! Even if I don’t know how a fish works at a molecular level, there are some cases where I can clearly tell that a fish is dead.  
即使不深入这些函数，你也应该能够判断它们是否有 bug。这就是抽象的魅力！即使我不知道鱼在分子层面上是如何运作的，在某些情况下，我也能清楚地判断出鱼已经死了。

If you find that one of these functions has a bug, you should completely rewrite it rather than trying to fix it.  
如果您发现其中一个函数有错误，您应该完全重写它而不是尝试修复它。

Now that we’ve told you what “step over” does, try exploring how it works exactly and try to find the two bugs. **If you’re having the issue that the using run (or debug) button in the top right keeps running DebugExercise1, right click on DebugExercise2 to run it instead.**  
既然我们已经告诉了你“单步执行”的功能，那就试着探索一下它的具体工作原理，并找出那两个 bug。 **如果你遇到的问题是在右上角使用“运行”（或“调试”）按钮时，它仍然运行着“DebugExercise1”，请右键单击“DebugExercise2”来运行它。**

If you get stuck or just want more guidance, read the directions below.  
如果您遇到困难或只是需要更多指导，请阅读以下说明。

#### Further Guidance (for those who want it)  
进一步指导（对于那些需要的人）

To start, try running the program. The `main` method will compute and print an answer to the console. Try manually computing the answer, and you’ll see that the printed answer is incorrect. If you don’t know how to manually compute the answer, reread the description of what the function is supposed to do above, or read the comments in the provided code.  
首先，尝试运行该程序。main `main` 将计算答案并将其打印到控制台。尝试手动计算答案，您会发现打印的答案是错误的。如果您不知道如何手动计算答案，请重新阅读上面关于该函数功能的描述，或阅读所提供代码中的注释。

Next, set a breakpoint to the line in `main` that calls `sumOfElementwiseMaxes`. Then use the debug button, followed by the step-into function to reach the first line of `sumOfElementWiseMaxes`. Then use the “step over” button on the line that calls `arrayMax`. What is wrong with the output (if anything), i.e. how does it fail to match your expectations? Note that to see the contents of an array, you may need to click the rightward pointing triangle next to the variable name in the variables tab of the debugger window in the bottom panel.  
接下来，在 `main` 函数中调用 `sumOfElementwiseMaxes` 的那一行设置断点。然后使用“调试”按钮，接着使用单步执行函数，到达 `sumOfElementWiseMaxes` 的第一行。最后，在调用 `arrayMax` 那一行使用“单步跳过”按钮。输出结果有什么问题（如果有的话），也就是说，它为什么不符合你的预期？请注意，要查看数组的内容，你可能需要点击底部面板中调试器窗口“变量”选项卡中变量名称旁边的向右三角形。

If you feel that there is a bug, step into `arrayMax` (instead of over it) and try to find the bug. Reminder: do not step into `max`. You should be able to tell if `max` has a bug using step over. If `max` has a bug, replace it completely.  
如果您觉得存在错误，请进入 `arrayMax` 内部（而不是跳过它），并尝试查找错误。提醒：不要进入 `max` 内部。您应该能够通过跳过来判断 `max` 是否存在错误。如果 `max` 存在错误，请将其完全替换。

Repeat the same process with `arraySum` and `add`. Once you’ve fixed both bugs, double check that the `sumOfElementwiseMaxes` method works correctly for the provided inputs. Note: This is not proof that `sumOfElementwiseMaxes` is correct, but it’s not necessary to write any additional tests to help verify this fact (that will be coming next week).  
对 `arraySum` 和 `add` 重复相同的过程。修复这两个错误后，请仔细检查 `sumOfElementwiseMaxes` 方法是否能够正确处理所提供的输入。注意：这并不能证明 `sumOfElementwiseMaxes` 是正确的，但无需编写任何其他测试来验证这一点（测试将于下周发布）。

### Recap: Debugging  回顾：调试

By this point you should understand the following tools:  
至此，您应该了解以下工具：

- Breakpoints  断点
- Stepping over  跨过
- Stepping into  步入
- Stepping out (though you might not have actually used this feature for this lab)  
    走出去（尽管你可能实际上并没有在这个实验中使用此功能）

However, this is simply scratching the surface of the features of the debugger! Feel free to experiment. For example you might try to figure out what the “Watches” tab does. Another handy feature we won’t cover is the “Evaluate Expression” button (one of the last buttons on the row of step into/over/out buttons – it looks like a calculator). In Lab 3 and 4, we will also show off some additional debugger features.  
然而，这只是调试器功能的冰山一角！您可以自由尝试。例如，您可以尝试弄清楚“Watches”选项卡的功能。我们不会介绍的另一个实用功能是“Evaluate Expression”按钮（它是单步执行/跳过/单步执行按钮行中的最后一个按钮，看起来像个计算器）。在实验 3 和实验 4 中，我们还将展示一些额外的调试器功能。

Be sure to also check out our [Debugging Guide](http://sp21.datastructur.es/materials/guides/debugging-guide.html)! It discusses some features that were not covered in this lab (e.g. conditional breakpoints), but is still a great overview of debugging if you need it!  
请务必查看我们的[调试指南](http://sp21.datastructur.es/materials/guides/debugging-guide.html) ！它讨论了一些本实验未涵盖的功能（例如条件断点），但如果您需要，它仍然是一个很棒的调试概述！

## JUnit and Unit Testing  JUnit 和单元测试

We now turn our attention to JUnit and Unit Testing, which were covered in lecture 3.  
现在我们将注意力转向第 3 讲中涉及的 JUnit 和单元测试。

Unit Testing is a great way to rigorously test each method of your code and ultimately ensure that you have a working project.  
单元测试是严格测试代码的每种方法并最终确保您有一个可运行的项目的好方法。

The “Unit” part of Unit Testing comes from the idea that you can break your program down into units, or the smallest testable part of an application. Therefore, Unit Testing enforces good code structure (each method should only do “One Thing”), and allows you to consider all of the edge cases for each method and test for them individually.  
单元测试中“单元”的概念源于这样一种理念：你可以将程序分解成多个单元，或者说是应用程序中最小的可测试部分。因此，单元测试强制执行良好的代码结构（每个方法应该只做“一件事”），并允许你考虑每个方法的所有边缘情况，并分别进行测试。

In this class, you will be using JUnit to create and run tests on your code to ensure its correctness. And when JUnit tests fail, you will have an excellent starting point for debugging. Furthermore, if you have some terrible bug that is hard to fix, you can use git to revert back to a state when your code was working properly according to the JUnit tests (we’ll talk about how to revert your code to old versions when we get to lab 4).  
在本课程中，您将使用 JUnit 创建并运行代码测试，以确保其正确性。当 JUnit 测试失败时，您将拥有一个绝佳的调试起点。此外，如果您遇到了一些难以修复的严重错误，您可以使用 git 将代码恢复到 JUnit 测试结果显示正常运行的状态（我们将在实验 4 中讨论如何将代码恢复到旧版本）。

#### JUnit Syntax  JUnit 语法

As discussed in lecture, JUnit tests are written in Java.  
正如讲座中所讨论的，JUnit 测试是用 Java 编写的。

Open `ArithmeticTest.java`.  
打开 `ArithmeticTest.java` 。

The first thing you’ll notice are the imports at the top (IntelliJ sometimes shortens these to `import ...`; just click on the `...` to expand this and see what exactly is being imported). These imports are what give you easy access to the JUnit methods and functionality that you’ll need to run JUnit tests. For more information, see the [Testing lecture video](https://www.youtube.com/playlist?list=PL8FaHk7qbOD4ZfVY8g8lo5dFrLP-ctGmT).  
您首先会注意到顶部的导入（IntelliJ 有时会将其缩写为 `import ...` ；只需点击 `...` 即可展开它并查看具体导入的内容）。这些导入使您可以轻松访问运行 JUnit 测试所需的 JUnit 方法和功能。更多信息，请观看[测试讲座视频](https://www.youtube.com/playlist?list=PL8FaHk7qbOD4ZfVY8g8lo5dFrLP-ctGmT) 。

Next, you’ll see that there are two methods in `ArithmeticTest.java`: `testProduct` and `testSum`. These methods follow this format:  
接下来，你会看到 `ArithmeticTest.java` 中有两种方法： `testProduct` 和 `testSum` 。这些方法遵循以下格式：

```
@Test
public void testMethod() {
    assertEquals(<expected>, <actual>);
}
```

`assertEquals` is a common method used in JUnit tests. It tests whether a variable’s actual value is equivalent to its expected value.  
`assertEquals` 是 JUnit 测试中常用的方法。它测试变量的实际值是否等于其预期值。

When you create JUnit test files, you should precede each test method with a `@Test` annotation, and can have one or more `assertEquals` or `assertTrue` methods (provided by the JUnit library). **All tests must be non-static.** This may seem weird since your tests don’t use instance variables and you probably won’t instantiate the class. However, this is how the designers of JUnit decided tests should be written, so we’ll go with it.  
创建 JUnit 测试文件时，应该在每个测试方法前面加上 `@Test` 注解，可以有一个或多个 `assertEquals` 或 `assertTrue` 方法（由 JUnit 库提供）。 **所有测试都必须是非静态的。** 这可能看起来很奇怪，因为你的测试不使用实例变量，而且你 可能不会实例化该类。然而， JUnit 决定应该编写测试，因此我们将采用它。

## Running JUnit Tests in IntelliJ (or another IDE)  
在 IntelliJ（或其他 IDE）中运行 JUnit 测试

Note: If you’ve decided not to use IntelliJ, you are on your own when it comes to running JUnit tests. Staff are not trained for and will not provide support for students who want to use other IDEs or command line compilation and execution tools.  
注意：如果您决定不使用 IntelliJ，那么在运行 JUnit 测试时，您将需要自行处理。我们的工作人员未接受过相关培训，也不会为想要使用其他 IDE 或命令行编译和执行工具的学生提供支持。

With `ArithmeticTest.java` open, click the `Run...` option under the `Run` menu at the top of IntelliJ as shown in the following screenshot.  
打开 `ArithmeticTest.java` ，单击 `Run` 下的 `Run...` 选项 IntelliJ 顶部的菜单，如下面的屏幕截图所示。

![Run Options](https://sp21.datastructur.es/materials/lab/lab2/img/lab3_run.png)

After clicking “Run…”, you should see some number of options that will look something like the list below. The number of items in your list may vary.  
点击“运行…”后，您应该会看到一些选项，类似下面的列表。列表中的项目数量可能会有所不同。

![Run Options](https://sp21.datastructur.es/materials/lab/lab2/img/lab3_run_menu.png)

The option we care about is the one that says “ArithmeticTest” next to the red and green arrows (next to the 1. in the image above).  
我们关心的选项是红色和绿色箭头旁边的“ArithmeticTest”（上图中 1 旁边）。

Select this one, and you should see something like:  
选择这个，你应该看到类似这样的内容：

![Run Options](https://sp21.datastructur.es/materials/lab/lab2/img/default_renderer.png)

This is saying that the test on line 25 of `ArithmeticTest.java` failed. The test expected 5 + 6 to be 11, but the `Arithmetic` class claims 5 + 6 is 30. You’ll see that even though `testSum` includes many `assert` statements, only one failure is shown.  
这说明 `ArithmeticTest.java` 文件第 25 行的测试失败了。该测试预期 5 + 6 的结果为 11，但 `Arithmetic` 类声称 5 + 6 的结果为 30。你会看到，尽管 `testSum` 包含许多 `assert` 语句，但只显示一次失败。

This is because JUnit tests are short-circuiting – as soon as one of the asserts in a method fails, it will output the failure and move on to the next test.  
这是因为 JUnit 测试是短路的——只要方法中的一个断言失败，它就会输出失败并转到下一个测试。

Try clicking on the `ArithmeticTest.java:27` in the window at the bottom of the screen and IntelliJ will take you straight to the line which caused the test to fail. This can come in handy when running your own tests on later projects.  
尝试点击屏幕底部窗口中的 `ArithmeticTest.java:27` 会直接跳转到导致测试失败的那一行。这在你以后的项目上运行自己的测试时会非常有用。

Now fix the bug, either by inspecting `Arithmetic.java` and finding the bug, or using the IntelliJ debugger to step through the code until you reach the bug.  
现在修复该错误，可以通过检查 `Arithmetic.java` 并找到错误，或者使用 IntelliJ 调试器逐步执行代码直到找到错误。

After fixing the bug, rerun the test, and if you’re using the default renderer, you should get a nice glorious green bar. Enjoy the rush.  
修复错误后，重新运行测试。如果您使用的是默认渲染器，应该会看到一个漂亮的绿色进度条。享受这种快感吧。

## Application: IntLists  应用程序：IntLists

As discussed in Monday’s lecture, an `IntList` is our CS61B implementation for a naked recursive linked list of integers. Each `IntList` has a `first` and `rest` variable. The `first` is the `int` element contained by the node, and the `rest` is the next chain in the list (another `IntList`!).  
正如周一课程中讨论的那样， `IntList` 是我们 CS61B 中对整数裸递归链表的实现。 `first` `IntList` 都有一个 `first` 和 `rest` 变量。first 是节点包含的 `int` 元素， `rest` 是列表中的下一个链表（又一个 `IntList` ！）。

We have created a file `IntListExercises.java` that contains three methods, each of which are buggy. Your task in this section is to find and fix the bugs! To assist you, we’ve added some helpful starter code and test skeletons, which we explain below.  
我们创建了一个文件 `IntListExercises.java` ，其中包含三个方法，每个方法都存在错误。您在本节中的任务是查找并修复这些错误！为了帮助您，我们添加了一些有用的入门代码和测试框架，我们将在下文中进行解释。

### *Starter Code  入门代码

Added to our implementation in Monday’s lecture are two methods in the `IntList` class, `print` and `of`. The `of` method is a convenience method for creating `IntList`s. Here’s a quick demonstration of how it works. Consider the following code that you’ve seen in lecture for creating an `IntList` containing the elements 1, 2, and 3.  
在周一的课程中，我们在 `IntList` 类的实现中添加了两个方法： `print` 和 `of` `of` 是一种创建 `IntList` 的便捷方法。下面是一个快速演示。请考虑您在课程中看到的以下代码，该代码用于创建一个包含元素 1、2 和 3 的 `IntList` 。

```java
IntList lst = new IntList(1, new IntList(2, new IntList(3, null)));
```

That’s a lot of typing, and is quite confusing! The `IntList.of` method addresses this problem. To create an IntList containing the elements 1, 2, and 3, you can simply type:  
这需要输入很多代码，而且相当混乱！ `IntList.of` 方法解决了这个问题。要创建一个包含元素 1、2 和 3 的 IntList，只需输入：

```java
IntList lst = IntList.of(1, 2, 3);
```

Isn’t that great?! It works for lists of any number of elements!  
是不是很棒？！它适用于任意数量元素的列表！

```java
// Creates an empty list!
IntList empty = IntList.of();

// Creates an IntList one element, 7
IntList oneElem = IntList.of(7);

// Creates an IntList with many elements
IntList manyElems = IntList.of(5, 4, 3, 2, 1);
```

The other method `print` returns a String representation of an IntList.  
另一种方法 `print` 返回 IntList 的字符串表示形式。

```java
IntList lst = IntList.of(1, 2, 3);
System.out.println(lst.toString())

// Output: 1 -> 2 -> 3
```

These methods don’t add any real functionality to the `IntList` class per-se, but they do provide convenient ways of creating and displaying `IntList`s, respectively. We use these convenience methods to make testing easier, and you will get some practice with these methods when you write your own JUnit test for debugging `IntList`s!  
这些方法本身不会给 `IntList` 类添加任何实际功能，但它们分别提供了创建和显示 `IntList` 便捷方式。我们使用这些便捷方法是为了简化测试，当您编写自己的 JUnit 测试来调试 `IntList` 时，您将有机会练习使用这些方法！

### Part A: IntList Iteration  
A 部分：IntList 迭代

In this part, we will be debugging the `addConstant` method in `IntListExercises.java`. This method is intended to take in an `IntList` and mutatively add a constant to each element of the list.  
在本部分中，我们将调试 `IntListExercises.java` 中的 `addConstant` 方法。此方法旨在接收一个 `IntList` ，并向列表的每个元素可变地添加一个常量。

```java
/* Expected Behavior */

IntList lst = IntList.of(1, 2, 3);

addConstant(lst, 1);
System.out.println(lst.toString());
// Output: 2 -> 3 -> 4

addConstant(lst, 4);
System.out.println(lst.toString());
// Output: 6 -> 7 -> 8
```

Uh oh! The `addConstant` implementation we have provided in the starter code is buggy! We have provided three tests in `AddConstantTest.java` that can help you isolate the bug. These tests exercise the `IntList.toString` and `IntList.of` methods mentioned above! Step through each of these tests with the Java Debugger to help you isolate the bug. Once you’ve isolated the bug, fix it.  
哎呀！我们在起始代码中提供的 `addConstant` 实现有 bug！我们在 `AddConstantTest.java` 中提供了三个测试，可以帮助您找出 bug。这些测试分别调用了上面提到的 `IntList.toString` 和 `IntList.of` 方法！使用 Java 调试器逐一执行这些测试，可以帮助您找出 bug。找出 bug 后，请修复它。

### Part B: Nested Helper Methods and Refactoring for Debugging  
B 部分：嵌套辅助方法和重构调试

In this part, we will be debugging the `setToZeroIfMaxFEL` method in `IntListExercises.java`.  
在本部分中，我们将调试 `IntListExercises.java` 中的 `setToZeroIfMaxFEL` 方法。

This method performs a very strange task. Specifically, it replaces the value at a node in an IntList with 0 if (and only if) the max of the IntList _starting at that node_ has the same first and last digit. Thus, in the method name `FEL` is an abbreviation for “first equals last”.  
此方法执行一项非常奇怪的任务。具体来说，当（且仅当） _从 IntList 节点开始的 IntList 的最大值的首位和末位数字相同时，它会将 IntList 中该_节点的值替换为 0。因此，方法名称 `FEL` 是“首位等于末位”的缩写。

For example, if we pass the IntList `55 -> 22 -> 45 -> 44 -> 5` it will set the values 55, 44, and 5 to zero so that the list becomes `0 -> 22 -> 45 -> 0 -> 0`. This is because:  
例如，如果我们传递 IntList `55 -> 22 -> 45 -> 44 -> 5` 它会将值 55、44 和 5 设置为零，以便列表变为 `0 -> 22 -> 45 -> 0 -> 0` 。这是因为：

- The IntList starting from 55 has max value 55, which has the same first and last digit, so this value is set to zero.  
    从 55 开始的 IntList 的最大值是 55，其首位数字和末位数字相同，因此该值设置为零。
- The IntList starting from 22 has max value 45, which does not have the same first and last digit, so 22 is not changed.  
    从 22 开始的 IntList 的最大值是 45，其首位数字和末位数字不同，因此 22 不会改变。
- The IntList starting from 45 has max value 45, which does not have the same first and last digit, so 45 is not changed.  
    从 45 开始的 IntList 的最大值是 45，其首位数字和末位数字不同，因此 45 不会改变。
- The IntList starting from 44 has max value 44, which has the same first and last digit, so 44 is set to zero.  
    从 44 开始的 IntList 的最大值是 44，其首位数字和末位数字相同，因此 44 被设置为零。
- The IntList starting from 5 has max value 5, which has the same first and last digit, so 5 is set to zero.  
    从 5 开始的 IntList 的最大值是 5，其首位数字和末位数字相同，因此 5 被设置为零。

To test your understanding, consider the IntList `5 -> 535 -> 35 -> 11 -> 10 -> 0`. What should be the list after calling `setToZeroIfMaxFEL` is called? Check our answer by looking at `testZeroOutFELMaxes3` in `SetToZeroIfMaxFELTest`.  
为了测试你的理解，请考虑 IntList `5 -> 535 -> 35 -> 11 -> 10 -> 0` 。调用 `setToZeroIfMaxFEL` 之后，列表应该是什么？通过查看 `SetToZeroIfMaxFELTest` 中的 `testZeroOutFELMaxes3` 来验证我们的答案。

If you run the tests, you’ll see that the method is buggy. Specifically, test 3 fails.  
如果你运行测试，你会发现该方法有 bug。具体来说，测试 3 失败了。

Set a breakpoint on the first line of `setToZeroIfMaxFEL` and debug only `testZeroOutFELMaxes3`. You can debug a single test by opening `SetToZeroIfMaxFELTest.java`, locating the method `testZeroOutFELMaxes3()`, and clicking on the green arrow icon to the left of the method definition. If the test has already been run before, the green arrow icon may turn into a green checkmark coupled with the green arrow (if the test passed before) OR it may turn into a red exclamation mark coupled with a green arrow (if the test failed before). An example of the latter two cases is depicted below.  
在 `setToZeroIfMaxFEL` 的第一行设置断点，并仅调试 `testZeroOutFELMaxes3` 。您可以调试单个测试，方法是打开 `SetToZeroIfMaxFELTest.java` ，找到方法 `testZeroOutFELMaxes3()` ，然后点击方法定义左侧的绿色箭头图标。如果测试之前已经运行过，绿色箭头图标可能会变成绿色复选标记和绿色箭头（如果测试之前已通过），或者可能会变成红色感叹号和绿色箭头（如果测试之前已失败）。后两种情况的示例如下所示。![how-to-run-a-single-test](https://sp21.datastructur.es/materials/lab/lab2/img2/how-to-run-a-single-test.png)

Use step-in a couple of times, which will take you to the line that says `if (firstDigitEqualsLastDigit(max(p)))`. When you click step-in a third time, you’ll see both `firstDigitEqualsLastDigit` and `max` get highlighted, as shown below:  
使用 step-in 几次，它会跳转到显示 `if (firstDigitEqualsLastDigit(max(p)))` 的那一行。第三次点击 step-in 时，你会看到 `firstDigitEqualsLastDigit` 和 `max` 都被高亮显示，如下所示：

![debugger wants you to pick a function](https://sp21.datastructur.es/materials/lab/lab2/img2/debuggerPickAFunction.png)

Since we have a nested function call, IntelliJ is asking us which function we’d like to step into. If you’d like, you can click on one or the other. If you click on `max`, you’ll see all the details of the call to `max`. If you click on `firstDigitEqualsLastDigit`, the call to `max` will get stepped-over.  
由于我们有一个嵌套函数调用，IntelliJ 会询问我们想要单步执行哪个函数。如果您愿意，可以点击其中一个。如果您点击 `max` ，您将看到对 `max` 调用的所有详细信息。如果您点击 `firstDigitEqualsLastDigit` ，则对 `max` 的调用将被单步执行。

Personally, I find code like this hard to debug! One tactic I use in circumstances like this is to refactor my code to make it more debugging friendly. Let’s try this out!  
就我个人而言，我觉得这样的代码很难调试！在这种情况下，我常用的一个策略是重构代码，让它更容易调试。我们来试试吧！

Change the code so that it looks like this:  
更改代码，使其看起来像这样：

```
    int currentMax = max(p);
    boolean firstEqualsLast = firstDigitEqualsLastDigit(currentMax);
    if (firstEqualsLast) {
        p.first = 0;
    }
```

Now that you’ve done this, use the step-over feature to identify which call to `max` or `firstDigitEqualsLastDigit` is yielding the wrong answer. **Important: Don’t use step-in until you’ve found a call to `max` or `firstDigitEqualsLastDigit` that yields the wrong answer.** Otherwise you’re just wasting time running through every single line of code. That is, if you’re watching every single iteration of every single call of the max function, you’re not using the debugger properly!  
完成上述操作后，请使用步进功能来识别哪个 `max` 或 `firstDigitEqualsLastDigit` 调用产生了错误结果。 **重要提示：在找到导致错误结果的 `max` 或 `firstDigitEqualsLastDigit` 调用之前，请勿使用步进功能。** 否则，您只是在浪费时间逐行检查代码。也就是说，如果您监视 max 函数每次调用的每次迭代，那么您就没有正确使用调试器！

Once you’ve found a call to `max` or `firstDigitEqualsLastDigit` that yields a weird result, start the debugging process over, and this time, when you get back to the argument that yielded the weird result, click step-in instead of step-out. Note: In Lab 4, we’ll talk about a useful idea known as a “conditional breakpoint” that will avoid the need to start back over from the beginning.  
一旦发现对 `max` 或 `firstDigitEqualsLastDigit` 调用产生了奇怪的结果，就重新开始调试过程。这一次，当你回到产生奇怪结果的参数时，点击“步入”而不是“步出”。注意：在实验 4 中，我们将讨论一个称为“条件断点”的有用概念，它可以避免从头开始。

Once you’ve identified the bug, fix it. Also feel free to change the refactored code back into the one-line version i.e. `if (firstDigitEqualsLastDigit(max(p)))`.  
找到错误后，请修复它。您也可以将重构后的代码改回单行版本，例如 `if (firstDigitEqualsLastDigit(max(p)))` 。

Note: In the real world, you would have ideally tested `max` and `firstDigitEqualsLastDigit` separately before using them in the `setToZeroIfMaxFEL` method.  
注意：在现实世界中，理想情况下，在 `setToZeroIfMaxFEL` 方法中使用 `max` 和 `firstDigitEqualsLastDigit` 之前，您应该分别对其进行测试。

### Part C: Tricky IntLists!  C 部分：棘手的 IntLists！

In this part, we will be debugging the `squarePrimes` method in `IntListExercises.java`. This method is intended to take in an `IntList`, square all its prime elements, and leave the composite (not-prime) elements alone. It returns `true` if at least one of the elements got squared, and `false` otherwise.  
在本部分中，我们将调试 `IntListExercises.java` 中的 `squarePrimes` 方法。此方法用于接收一个 `IntList` 元素，对其所有素数元素求平方，并保留复合（非素数）元素。如果至少有一个元素求平方，则返回 `true` ，否则 `false` 。

As an example, consider an `IntList` containing the elements 14, 15, 16, 17, and 18. After running `squarePrimes`, we expect the prime element (17) to be squared and the composite elements (14, 15, 16, 18) to remain the same. The output of the `squarePrimes` function should `true`, since it should modify the `IntList` to become `14, 15, 16, 289, 18`. In code:  
例如，假设一个 `IntList` 包含元素 14、15、16、17 和 18。运行 `squarePrimes` 后，我们预期素数 (17) 会被平方，而 `squarePrimes` 元素 (14、15、16、18) 保持不变。squarePrimes 函数的输出应该为 `true` ，因为它应该将 `IntList` 修改为 `14, 15, 16, 289, 18` 。代码如下：

```
/* Expected Behavior */

IntList lst = IntList.of(14, 15, 16, 17, 18);
System.out.println(lst.toString());
// Output: 14 -> 15 -> 16 -> 17 -> 18

boolean changed = squarePrimes(lst);
System.out.println(lst.toString());
// Output: 14 -> 15 -> 16 -> 289 -> 18

System.out.println(changed);
// Output: true
```

The `squarePrimes` method uses the function `Primes.isPrime(int x)` as a helper method. `isPrime` simply returns `true` if its argument is a prime number, and returns `false` if its argument is composite. You don’t have to worry about how it determines whether a number is prime or not – that’s rather complicated! (Optional: For the curious reader, check out the “Fermat Primality Test” online). Instead, we expect you to treat the `isPrime` function as a blackbox. While you are debugging, use the “Step Over” feature on the `isPrime` function. This will allow you to verify its inputs and outputs are correct without being concerned about its implementation.  
`squarePrimes` 方法使用 `Primes.isPrime(int x)` 函数作为辅助方法。如果参数是素数， `isPrime` 会返回 `true` ；如果参数是合数，则返回 `false` 。您无需担心它如何判断一个数是否为素数——这相当复杂！（可选：如果您对此感兴趣，可以在线查看“费马素数测试”）。我们希望您将 `isPrime` 函数视为一个黑盒。在调试时，请使用 `isPrime` 函数的“Step Over”功能。这样您就可以验证其输入和输出是否正确，而无需担心其具体实现。

We’ve explained what the `squarePrimes` method is supposed to do above. Unfortunately, the `squarePrimes` method is buggy. It’s your job to find and fix the bug! In order to do this, we recommend that you:  
上面我们已经解释了 `squarePrimes` 方法的功能。遗憾的是， `squarePrimes` 方法存在 bug。找到并修复 bug 是你的任务！为此，我们建议你：

1. Create JUnit Test(s) that test the `squarePrimes` method over a variety of different inputs. Make sure to test that it makes updates to the passed-in `IntList` correctly _and_ returns the correct `boolean` value.  
    创建 JUnit 测试，针对各种不同的输入测试 `squarePrimes` 方法。确保测试方法能够正确更新传入的 `IntList` _并_返回正确的 `boolean` 值。
2. Once you’ve created a JUnit Test on which `squarePrimes` fails, you’ve made progress! Woohoo! Now use the Java Debugger to step through the problem and isolate the bug.  
    一旦你创建了一个 `squarePrimes` 失败的 JUnit 测试，你就取得了进展！哇哦！现在使用 Java 调试器逐步解决问题并隔离错误。
3. Finally, write a fix to the bug. For this particular bug, the fix is not many lines of code. Finding the bug is much more difficult than fixing it!  
    最后，编写一个修复程序来修复这个 bug。对于这个特定的 bug，修复过程并不需要几行代码。找到 bug 比修复它要困难得多！

To get you started on this task, we’ve created one JUnit Test for you, `SquarePrimesTest.testSquarePrimesSimple`. This method checks that the example we gave above (an `IntList` of 14, 15, 16, 17, and 18) is correctly modified by the `squarePrimes` function, and that the `squarePrimes` function returns the correct value (`true` in this case). Unfortunately this test passes: You’ll have to write another test that fails! You can use `testSquarePrimesSimple` as an example of how to write a JUnit Test. Good luck!  
为了帮助您完成这项任务，我们为您创建了一个 JUnit 测试，名为 `SquarePrimesTest.testSquarePrimesSimple` 。此方法检查我们上面给出的示例（包含 14、15、16、17 和 18 的 `IntList` ）是否被 `squarePrimes` 函数正确修改，以及 `squarePrimes` 函数是否返回正确的值（在本例中为 `true` ）。遗憾的是，此测试通过了：您必须编写另一个失败的测试！您可以使用 `testSquarePrimesSimple` 作为编写 JUnit 测试的示例。祝您好运！

## Submission  提交

As before, push your code to GitHub and submit to Gradescope to test your code. One thing you’ll notice is that some of the tests are “Hidden”. This means that we don’t reveal to you what the test does, and if you fail the test, we give a purposefully vague error message. This is because for this lab, we want you to focus on learning how to debug by yourselves without relying on informative messages from the autograder.  
和之前一样，将您的代码推送到 GitHub 并提交到 Gradescope 进行测试。您会注意到，有些测试是“隐藏”的。这意味着我们不会向您透露测试的具体内容，如果您未通过测试，我们会故意显示一个模糊的错误信息。这是因为在本实验中，我们希望您专注于学习如何自行调试，而不是依赖自动评分器提供的信息。

## Full Recap  完整回顾

In this lab, we went over:  
在本实验中，我们讨论了：

- Stepping into, over, and out inside the IntelliJ debugger (this will be handy for projects!)  
    在 IntelliJ 调试器中进入、越过和退出（这对于项目来说很方便！）
- Unit Testing (big picture)  
    单元测试（大图）
- JUnit syntax and details  JUnit 语法和详细信息
- Writing JUnit tests  编写 JUnit 测试
- Debugging Using JUnit  使用 JUnit 进行调试
- Running the Style Checker  
    运行样式检查器

## FAQ and Common Issues  常见问题

### Things like String or String.equals() are red!  
String 或 String.equals() 之类的东西是红色的！

This is a JDK issue, go to File > Project Structure > Project > Project SDK to troubleshoot. If your Java version is 15.0, then you should have a 15.0 SDK and a Level 15 “Project Language Level”.  
这是 JDK 问题，请前往“文件”>“项目结构”>“项目”>“项目 SDK”进行故障排除。如果您的 Java 版本是 15.0，则应该拥有 15.0 版 SDK 和 15 级“项目语言级别”。