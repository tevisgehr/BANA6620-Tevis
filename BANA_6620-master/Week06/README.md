### Command Line Essentials

For the purposes of working in any 'Big Data' real world situation, it is essential that you feel comfortable in the command line (Linux/Unix).  It is also necessary that you feel comfortable using `git`.  The lecture notes for this week will illustrate the basic commands necessary to work on the command line, as well as with version control (git).  

In order to gain a more comprehensive view of the command line, I would suggest picking up a book.  However, this set of notes will cover the very basics, which are also provided [here](http://linuxcommand.org/lts0020.php).

#### Introduction to Unix

Unix is a multitasking, multiuser computer operating system.  Most computers either run a Microsoft Windows operating system or some type of unix operating system.  The wonderful part of the unix operating system is that it is open source, which allows anyone to view the source code and make changes.  This system has been around for a long, long time, and it is extremely popular with distributions like MacOS, Red Hat, and Ubuntu all with underlying unix OS. All of the commands shown below are possible from any of these distributions.  

In order to run similar commands on a PC, we will be using the `git` download.  Although, you could also run many of the commands for the PowerShell, which you can find with a quick search on your PC.

##### Common Commands

In terms of navigation, we commonly will use:

* `pwd` - prints your current location - `print working directory`
* `cd` - to `change directory`
* `ls` - will list all of the files in our current location - `list`

To create and remove files:

* `touch` - creates an empty file
* `rm` - to `remove` a file

To create and remove directories:

* `mkdir` - to `make directory`
* `rmdir` - to `remove directory`

To completely remove an entire directory we can run:

* `rm -rf` - this will `remove`, `recursively`, and `force` the removal of all items in a particular directory.

Other common commands include:

* `cp` - copy a file to new place - `cp path\to\current\file path\to\new\file`
* `mv` - move file to new place = `mv path\to\current\file path\to\new\file`

**Note**: It is important that you know `mv` will overwrite a file if you name it the same as another file at the same path.  You will obtain a warning depending on your distribution.

##### Keyboard Shortcuts

You are able to see past commands by arrowing up, there are a number of other [keyboard shortcuts](https://www.linux.com/learn/best-linux-keyboard-shortcuts) that can assist in your ability to move around in the terminal more efficiently.

Note here that `^h` is the same as `ctrl-h` on a mac, and the equivalent on a Windows system (try `ctrl` or `alt`).  

Some of the commands I use most often include:

* `^u` - Erase input from the current location to beginning of the line.
* `^k` - Erases input from the current location to the end of the line.
* `^a` - Move to the beginning of the line.
* `^e` - Move to the end of the line.  
* `^c` - Kill a running program
* `clear` - clear entire screen.


##### Git and Github

Learning git is beyond the scope of this class.  However, I would like to provide some resources to help you get started.  The documentation [here](https://git-scm.com/documentation) is your best resource.  However, you find you resonate best with a youtube video online.  

As you might be coming to terms with, Linux, git, and Github are not trivial to learn.  When working with others, we also introduce the idea of `branch`-ing in git.  Since we will not be using git as a means of working with others in this class, we will not be covering these topics.  However, if you are interested in pursuing software engineering roles, it is imperative that you gain a strong understanding of these topics.  I encourage the following resources for learning more about [git and Github](https://www.udacity.com/course/how-to-use-git-and-github--ud775), [Linux basics](https://www.udacity.com/course/linux-command-line-basics--ud595), [more Linux](https://www.udacity.com/course/configuring-linux-web-servers--ud299), and finally some [additional resources](http://freevideolectures.com/blog/2012/04/5-websites-learning-linux/).  You can actually write entire programs using just the command line.  See [here](http://linuxcommand.org/writing_shell_scripts.php) or [udemy](https://www.udemy.com/shell-scripting-linux/) (sorry I couldn't find any free courses) for additional details.
