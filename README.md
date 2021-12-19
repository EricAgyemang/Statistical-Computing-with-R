# Statistical-Computing-with-R
Statistical computing is the interface between statistics (mathematical statistics), mathematics
(numerical analysis) and computer science (programming and optimization).

# Description
Using R for any form of statistical analysis requires that you know what you are doing (statistically).
This is the purpose of having Elementary Statistics as the prerequisite for this course; it will be used to
expose you to the importance of knowing exactly what you are trying to do, or calculate. For this reason you
should have an elementary statistics text by your side whenever a task involves a particular statistical tool
— wrong or goofy use of statistical procedures and incorrect interpretations of results can lead to incorrect
coding on submitted assignments

Now, about those rabbit holes. Whether or not a particular task is designed to intentionally lead you
tantalizingly close to a potentially fascinating rabbit hole, you are encouraged to at least look down it.
Sometimes there will be, just below the surface, a really useful R capability (usually in the form of a
function) that will make a particular assigned task a piece of cake. Unless specifically forbidden to wander,
you are always encouraged to take advantage of such findings — and there are so many of them out there!

# Course Objectives

Computationally intensive statistical methods are a key component to modern data analysis methods. After completing this course, a successful 
student will be able to use statistical software to implement both traditional and state-of-the-art methods in computational statistics as well
as recognize situations where these methods are required.

# Goals for the Course:

    Be able to use R and RStudio to implement traditional and state-of-the-art methods in computational statistics.
    Be able to recognize when these methods are required.
    Have an enhanced understanding of statistics.

# Preliminaries
The website of The R Project for Statistical Computing is located at http://www.r-project.org/
The software, along with necessary downloading and installation instructions, are provided on this website.
Among the extensive documentation contained on this site are answers to a list of frequently asked questions
(FAQ’s) which address issues that may arise in the downloading and installation of R onto your computer.

# The RGui and Console
Figure 1 is a snapshot of what is seen when R is first started up. It is a good idea to familiarize yourself with
what is contained in the various drop-down menus contained in the RGui toolbar. In this course selected
options from only three menu items — File, Packages and Help — will be used. Other menu options can be
considered conveniences, the uses which you may learn at a later stage in your future adventures with R.
The R console provides a command line environment within which instructions for the R interpreter
can be entered. When a sequence of instructions is entered in the console, R interprets and executes the 
instructions.

      Note that the startup screen contains some preliminary basic instructions. Before continuing, clear the
      console by pressing the Ctrl key and then the l-key (denoted by Ctrl+L). This task can also be acomplished
      through an option in the Edit menu on the toolbar.

# The R (Script) Editor
Before continuing, clear the console using the keystroke sequence Ctrl+L.
The R (script) Editor is a basic text editor, much like Notepad from MS Windows. Benefits of using the
script editor over the command line environment for lengthy code include: not having to retype code every
time something minor (or serious) goes wrong; being able to run selected portions of code at a time; and
being able to save correct code for later recall.
To open a new script file select File→New script from the RGui toolbar, see Figure 4. When the R
Editor window pops up, click on the editor window to activate it and then select File→Save as... on the
RGui toolbar, see Figure 5. Follow the prompts and name this file, for example, Script1.R. The result will,
for example, be a script file with the following file path and name.
          
          C:\Docs\Stat400\Assign1\Script1.R
           or
           Z:\My Documents\Stat400\Assign1\Script1.R

# R’s Help Features
Information and help on R can be obtained using options present in the drop down menu, Help, on the RGui
toolbar, see Figure 3. The options provided are reasonably self-explanatory and can be extremely useful, so
time spent exploring the various resources available through the Help menu options is time well spent. Two
functions, help (can also use the shortcut “?”) and help.search (can also use the shortcut “??”) will be
found very useful. These can be run on the console. For example, run the following lines of code on the
console, one at a time (type in and press the enter key), and then browse through the documentation pages
that pop up.

    help(help)
