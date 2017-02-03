#### Introduction to Object Oriented Programming (OOP) in Python

##### Quick Aside 1: Running our Scripts


Before we jump into OOP, I would like to take a quick aside to chat about how we should go about reading in functions or classes from our own scripts.  If we save our scripts with a `.py`, we can read in the file path the same way we import libraries.  Consider we have the following python code within a file named `print_number.py`

```python
x = raw_input('Please enter a number: ')
print(x)
```

If we were within the directory where this file is saved, from within python we could run:

```python
In [1]: run print_number.py
```
to run the code within the script.  This would produce the following:

```python
In [1]: run print_number.py
Please enter a number:
```

We can also execute our python scripts from within the command line in the following way:

```
$ python print_number.py
```

When we import from python libraries, we are essentially running code from existing python scripts.  Imagine I have the following script, `my_functions.py`, that has the following contents:

```python
def does_stuff(lst):
    return 5

def does_stuff2(lst):
    return 7

def does_stuff3(thing1, thing2):
    '''
    In: thing1 and thing2 are ints or floats
    Out: int or float 3 times thing1 plus 6 times thing2
    '''
    return thing1*3 + thing2*6
```

If we are in the directory where we saved this file, we can run from within python:

```python
In [1]: import my_functions as myfunc

In [2]: myfunc.does_stuff()
Out[2]: 5

In [3]: myfunc.does_stuff3(6,8)
Out[3]: 66

In [4]: myfunc.does_stuff3?
Signature: myfunc.does_stuff3(thing1, thing2)
Docstring:
In: thing1 and thing2 are ints or floats
Out: int or float 3 times thing1 plus 6 times thing2
File:      ~/Documents/PythonScripts/random_scripts/my_functions.py
Type: function
```

Alternatively, if the number of functions and classes we had in the library (script) was really large, we might only choose to read in the functions or classes we wanted to use directly.  With our script, this would look like:

```python
In [1]: from my_functions import does_stuff3 as ds3

In [2]: ds3(5,6)
Out[2]: 51
```

When we work with our own scripts or with importing from other libraries, these methods of importing are a part of general workflow.  You will see these methods of importing at the beginning of nearly all python scripts.

If we want to test our code within one of these scripts, but we do not actually want to run the code that tests our scripts, we will want to add what is known as a [main block](http://stackoverflow.com/questions/419163/what-does-if-name-main-do).


##### Object Oriented Programming (OOP) Motivation

One of the most fundamental concepts that we must understand to become a strong programmer is the idea of [object oriented programming (OOP)](https://en.wikipedia.org/wiki/Object-oriented_programming).  In Python, everything is an object.  

What does it mean to say that everything in python is an object?  All of the data structures we worked with in the previous sections; they are objects.  New data structures we haven't worked with yet - they are objects, too.  An object has 2 components: **attributes** and **methods**:

1. **Attributes** hold information about our object.

2. **Methods** are procedures working with the information held on our object.  These are just like functions, which we have already introduced.

This idea about objects is the big picture to keep in mind.  Often the most difficult part about OOP is obtaining a grasp on all of the verbiage that is thrown around when discussing OOP in detail.  

It is important that we tie together **objects** and **classes**, as these two concepts are only useful if they coexist.  Essentially, classes are blueprints that outline the objects we create.  A class describes the methods and attributes of our objects.  You can imagine that before we build a car, we have a whole set of directions about the car. Specifically, we will need two pieces regarding our blue print:

1. Attributes - Data that is true about our car: color of the interior, exterior, automatic or manual, sunroof or not, etc.

2. Methods - What will our car do - accelerate, break, interact with other objects, etc.

Again, a class describes the attributes and methods of an object.  When we actually create an object of a particular class, this is known as instantiation.   You will commonly here, "We instantiate an object of class 'blah'". We actually have done this a ton already:

```python
x = 5 #instantiating an object of class int

y = 4.3 #instantiating an object of class float

my_string = 'this is my string' #instantiating an object of class string
```

Each of our objects (x,y,my_string) is an instantiation of a particular class.  We then saw that pressing `.` and `tab` following our object provides all the methods and attributes that are provided by the class of each type (int, float, string).  These data structures are all provided to us as a type of class.  

In this section, we will be looking at how we can write our own classes to instantiate our own objects, but first, let's consider the benefits and shortcomings of writing a class as opposed to the functions we have seen in previous section. Similar to functions, we want to write classes for the purpose of creating code that is reusable and that abstracts away the difficulty for other users.  For example, when we use the method `upper` on our string, we do not want to have to think about how exactly it works under the hood.

The reason for using a class as opposed to a function gets us into the design principles of OOP.  

##### Design Principles of OOP

There are three principles that are generally associated with OOP:

1. **Inheritance** - We can build off an existing class and inherit the properties of the existing class.

2. **Encapsulation** - Holding both our attributes and methods together in one place, while abstracting away the difficulty of what is actually happening.

3. **Polymorphism** - Allows for a shared interface for similar classes. The most popular example of polymorphism for the use of analyzing data is sklearn's machine learning methods of `fit`, `predict`, and `score`.  These methods can be performed for essentially all of the supervised learning classes within scikit learn.

These topics are fairly advanced; however, they should assist in your understanding of fundamental programming with regard to the use of classes.  

##### Class Creation

Similar to writing functions, we can create classes.  With that being said, there are a few more requirements when creating classes.  Let's take a look at some of the syntax:

```python
class MyClass(object):

```

We can see that instead of `def` we are using `class`.  We also use what is known as camel case instead of snake case in naming our class - this is simply a general convention, but will not break your code if not followed. Also above, we are inheriting from the class `object`.  Adding `object` is not essential to create our class, but in python we prefer [explicit to implicit](https://www.quora.com/What-is-meant-by-implicit-and-explicit-in-programming).  

The next portion of our python classes is an `__init__()` method.  This method gets called whenever we instantiate a class by default.  Generally this method acts as a holder of any attributes we would like to have right when we create our class.  The `__` leading and following the name of our method is because this method is a [magic method](http://www.rafekettler.com/magicmethods.html).  For now, we will look specifically at this magic method, but we will look closer at this later in the lecture.  Let's look at this in practice:

```python
class MyClass(object):
    def __init__(self, name, num_students):
        self.name = name
        self.num_students = num_students
```

In the above class, we are accepting two arguments that will live as attributes on our class, `arg1` and `arg2`.  Within any class, the first parameter of any of our methods will be `self`, which provides a way for us to interact with our instance of the class.  The passing of this reference to the current instance is done by default as the first parameter in python.

Within our `__init__()` method we are storing the arguments we pass to `name` and `num_students` on our object; hence the `self.name` and `self.num_students`, which stores these arguments on our object when we instantiate it.

```python
the_class = MyClass('Computing', 40)
```    

Above we now have **instantiated** our class, and `the_class` will now have two attributes stored on it: 'Computing' and 40.  I can access these attributes in the following way:

```python
In [2]: the_class.name
Out[2]: 'Computing'

In [3]: the_class.num_students
Out[3]: 40
```
You will notice, we did not put `()` at the end of `name` nor `num_students`.  The reason for this is because these are **attributes**, not **methods**.  Let's look at how we might add methods to our class.  Imagine we want have a method that creates accepts a question, and then adds it to a rolling list of questions.  

```python
class MyClass(object):
    def __init__(self, name, num_students):
        self.name = name
        self.num_students = num_students
        self.question_list = []

    def question(self, question):
        question_list.append(question)        
```

You can see above, that we have added an attribute to our class now that holds a list of our questions, `question_list`.  We also have new method, `question`, which accepts a parameter question and appends it to our list of questions.
 Now, imagine we want to remove questions as they are answered from the `question_list`, but add them to an answered question list.  Perhaps to keep the answer relevant, we might create a list of tuples with the question and the corresponding answer within the tuple.

 ```python
 class MyClass(object):
     def __init__(self, name, num_students):
         self.name = name
         self.num_students = num_students
         self.questions = []
         self.answer_list = []

     def question(self, question):
         self.question_list.append(question)

    def answered_question(self, ind, answer):
        '''
        Updates the question_list and answered_question_list to reflect the question you have answered.
        In:

        ind - takes the index of the question you are answering from the question_list

        answer - takes the answer to the question as a string
        Out: None
        '''
        self.answer_list.append((self.questions.pop(ind), answer))
 ```

 From the above, you can see that we have added another attribute, as well as a second method.  Now, let's put our class to work.  As long as we are in the same directory as our script, which I called `firstclass.py`, we can run the following:

```python
In [1]: import firstclass as fc

In [2]: my_class = fc.MyClass('Computing', 40)

In [3]: my_class.
my_class.answer_list        my_class.name               my_class.question
my_class.answered_question  my_class.num_students       my_class.question_list
```

Furthermore, we can start keeping track of asking questions.

```python
In [4]: my_class.question('Do you accept late assignments?')

In [5]: my_class.questions
Out[5]: ['Do you accept late assignments?']

In [6]: my_class.question('Can I bring my pet to class?')

In [7]: my_class.question('When does class get over?')

In [8]: my_class.questions
Out[8]: ['Do you accept late assignments?', 'Can I bring my pet to class?', 'When does class get over?']
```

We can also track the answers to these questions. Let's start by taking a look at the awesome doc-string we created, and then we can look at how

```python
In [9]: my_class.answered_question?
Signature: my_class.answered_question(ind, answer)
Docstring:
Updates the question_list and answered_question_list to reflect the question you have answered.
In:

ind - takes the index of the question you are answering from the question_list

answer - takes the answer to the question as a string
Out: None
File:      ~/Documents/Teaching/NewComputing/Week10/firstclass.py
Type:      instancemethod

In [10]: myclass.answered_question(0, 'No')

In [11]: myclass.questions
Out[11]: ['Can I bring my pet to class?', 'When does class finish?']

In [12]: myclass.answer_list
Out[12]: [('Do you accept late work?', 'No')]

In [13]: myclass.answered_question(0, 'No')

In [14]: myclass.answered_question(0, '9:15')

In [15]: myclass.questions
Out[15]: []

In [16]: myclass.ans
myclass.answer_list        myclass.answered_question  

In [17]: myclass.answer_list
Out[17]: [('Do you accept late work', 'No'), ('Can I bring my pet to class', 'No'), ('When does class finish?', '9:15')]
```

A class is particularly nice to use in this situation, as all the items within our class update.  If we were to attempt this same structure using a number of functions, this could turn into a very messy process.  

##### Quick Aside 2: Magic Methods

The title magic methods is a bit misleading, as there isn't anything really magical about magic methods (sorry to disappoint).  The `__init__` method we saw at the beginning of our first class is one example of a magic method, and it is the case that all of our magic methods in python will have these `__` before and after the method names, which is why I prefer **dunder functions** for double underscore functions.  Some other common magic methods include mathematical operations and logic (`+`, `-`, `*`, `>`, `<`, `==`), the `len` function, the print function, and [many more](http://www.rafekettler.com/magicmethods.html).  

Let's look at how we might incorporate them into our existing class above.  Right now if we were to run some of the commands we have seen our existing class instance, we would obtain some strange results - if we obtain any results at all:

```python
In [18]: len(myclass)
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-30-585f88bbde8e> in <module>()
----> 1 len(myclass)

TypeError: object of type 'MyClass' has no len()

In [19]: print(myclass)
<firstclass.MyClass object at 0x10385cad0>
```

Above, we can see two of our well known commands - `print` and `len`.  We can see that they both give irregular results to what we might expect.  These operations work a bit different than the methods we have seen used thus far on our own instantiations of objects.  That is, we are wrapping our instance in a function, rather than it 'living' as a method on our object.  


 ```python
class MyClass(object):
    def __init__(self, name, num_students):
        self.name = name
        self.num_students = num_students
        self.questions = []
        self.answer_list = []

    def __len__(self):
        return self.num_students

    def __str__(self):
        our_class_string = 'class: {}, number of students: {}'
        return our_class_string.format(self.name, self.num_students)

    def question(self, question):
         self.question_list.append(question)

    def answered_question(self, ind, answer):
        '''
        Updates the question_list and answered_question_list to reflect the question you have answered.
        In:

        ind - takes the index of the question you are answering from the question_list

        answer - takes the answer to the question as a string
        Out: None
        '''
        self.answer_list.append((self.questions.pop(ind), answer))

 ```

Above, we are controlling the `len()` operation by using the `__len__` method.  Similarly, we are controlling `print()` by using `__str__`.  It is worth noting we can actually control the output of the print statement by using either [`__str__` or `__repr__`](http://stackoverflow.com/questions/1436703/difference-between-str-and-repr-in-python).  

We now obtain useful information from the above commands:

 ```python
 In [20]: len(myclass)
 Out[20]: 40

 In [21]: print(myclass)
 class: Computing, number of students: 40
 ```

Let's take a look at how we can use magic methods to interact with more than one object at a time.  It is very common that we might want to compare two objects in some way.  When we are working with integers or floats, we frequently might ask the question of one is larger than another.  Really, we are working with magic methods under the hood.  Let's take a look at how this works in practice.  First, let's look at what happens by default, and then what control we have to change what is happening.

```python
In [22]: myclass2 = MyClass('Computing', 20)

In [23]: myclass == myclass2
Out[23]: False

In [24]: myclass == myclass2
Out[24]: False

In [25]: myclass > myclass2
Out[25]: False

In [26]: myclass < myclass2
Out[26]: True
```

This seems strange, as the number of students in `myclass` is 40, while there are only 20 in `myclass2`.  Clearly, this comparison is not intuitive.  Although we could use `len` or our attribute `num_students` to do a comparison, we should be able to create new objects that make the same sorts of comparisons.  This is where a whole new set of magic methods come into play.  Again, these methods are well documented [here](http://www.rafekettler.com/magicmethods.html).

```python
class MyClass(object):
    def __init__(self, name, num_students):
        self.name = name
        self.num_students = num_students
        self.questions = []
        self.answer_list = []

    def __len__(self):
        return self.num_students

    def __str__(self):
        our_class_string = 'class: {}, number of students: {}'
        return our_class_string.format(self.name, self.num_students)

    def __gt__(self, other):
        return self.num_students > other.num_students

    def __lt__(self, other):
        return self.num_students < other.num_students

    def __ge__(self, other):
        return self.num_students >= other.num_students

    def __le__(self, other):
        return self.num_students <= other.num_students

    def __eq__(self, other):
        return self.num_students == other.num_students

    def question(self, question):
         self.question_list.append(question)

    def answered_question(self, ind, answer):
        '''
        Updates the question_list and answered_question_list to reflect the question you have answered.
        In:

        ind - takes the index of the question you are answering from the question_list

        answer - takes the answer to the question as a string
        Out: None
        '''
        self.answer_list.append((self.questions.pop(ind), answer))
```

As a final resource towards magic methods, the [python documentation](https://docs.python.org/2/reference/datamodel.html#special-method-names) is also quite good for gaining a better understanding of what is possible.  

This concludes what we will discuss regarding building classes.  To get more practice, the following codewars problems may deem to be useful: [practice 1](https://www.codewars.com/kata/you-look-like-a-classy-instance-show-me-what-youve-got-part-1/train/python), [practice 2](https://www.codewars.com/kata/finish-guess-the-number-game/train/python) and [practice 3](https://www.codewars.com/kata/vector-class). Additionally, we will get some practice with a homework assignment aimed at building classes.


##### Quick Aside 3: Functions vs. Classes

It is a common question to ask: should I write a function or a class?  At the end of the day, you as the writer of a particular piece of code have all of the power to make this decision.  When considering encapsulating many functions within a class, I consider what are the moving parts that will be transferred from one function to the next.  If there are multiple similar arguments that are being transferred across functions, this might be just the place to implement a class.  

In another framework, we might only be using this function to provide some output.  We might not need that output to feed into another part of our process and the input might be very consistent.  For these reasons, you might choose to use a function.  Examples of writing functions are all over codewars for you to practice.

##### Quick Aside 4: Unit Testing Functions

When we use codewars, they test the functions we write to assure they are producing the correct results when given a certain set of inputs.  The process of writing these tests is called [unit testing](https://docs.python.org/2.7/library/unittest.html).  The process of writing these tests to make sure our code is robust to any possible input without freaking out is an essential part of software engineering.  

In general, you should have an idea about what your code is going to do, and you write unit tests that will be set up to test your code.  Before you write any code to actually do anything, you should already have your unit tests in place.  Let's look at a specific example where we build our own unit tests.  I cannot stress enough how import unit tests are to industry.  Software engineers are constantly testing their code to make sure it will work under all sorts of different [stress](https://www.quora.com/What-is-software-unit-testing-and-why-is-it-important).  

Let's look at a couple concrete examples where we can implement these tests. Below are two functions for which we can practice writing tests.  The doc string does a good job of describing the goal of each function.

```python
def count_characters(string):
    '''
    INPUT: STRING
    OUTPUT: DICT (STRING => INT)
    Return a dictionary which contains a count of the number of times each
    character appears in the string.
    Characters which would have a count of 0 should not need to be included in
    your dictionary.
    Capital and lower case letters should be counted as the same letter.
    If a string is not inputted, then the function should provide 'input not string' back to the user.
    Only letters should be counted as characters - not any other possible values (-,/, ,etc.).
    '''
    pass

def word_count(filename):
    '''
    INPUT: STRING
    OUTPUT: (INT, INT, INT)
    filename refers to a text file.
    Return a tuple containing these stats for the file in this order:
      1. number of words (broken by whitespace)
      2. number of characters
    '''
    pass
```

In order to create our tests, we should create a new python script, say `tests.py`.  Then in the same directory, we save our functions, but in a file named `my_functions.py`.  Our `tests.py` file will then hold the tests.  These tests will have the input and the corresponding output for each function.  In practice, we should have multiple tests for each function to show that the function is robust to all possible input values.  Below I have four test cases for our first function.  Can you think of additional tests you might add to our class?

```python
import unittest as unittest
import my_functions as a

class TestAssessment1(unittest.TestCase):

    def test_count_characters1(self):
        string = "abafdcggfaabe"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)

    def test_count_characters2(self):
        string = "AbafdcgGfaAbE"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)


    def test_count_characters3(self):
        string = "Aba5fd cgGfa-Ab/E"
        answer = {"a": 4, "b": 2, "c": 1, "d": 1, "e": 1, "f": 2, "g": 2}
        result = a.count_characters(string)
        self.assertEqual(result, answer)

    def test_count_characters4(self):
        string = 42
        answer = 'input not string'
        result = a.count_characters(string)
        self.assertEqual(result, answer)


    def test_word_count1(self):
        self.assertEqual(a.word_count('data/alice.txt'), (1615, 8461))

    def test_word_count2(self):
        self.assertEqual(a.word_count('test_text.txt'), (16, 76))


if __name__ == '__main__':
    unittest.main()

```

I have added the framework to test your functions within the `Examples` folder.  In order to run the unit tests, follow these steps:

* You will need **Python 2.7 or greater** - you can check your python version by running the following command in the terminal: `python -V`    

* You should then be able to run the tests with the following command from ipython `Examples/`:    

   `run tests`

* If you do not have py.test, you may see Import errors. Run the following command in case you see such errors:    

   `pip install pytest`     

* Now, `.` refers to passing test, `E` is an error in the code and `F` is a failure. Output of `..EFFFF` means 2 tests passed, one has an error and 4 fail.

```python
In [1]: run tests
..F.
======================================================================
FAIL: test_count_characters3 (__main__.TestAssessment1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/joshuabernhard/Documents/Teaching/NewComputing/Week10/Examples/tests.py", line 24, in test_count_characters3
    self.assertEqual(result, answer)
AssertionError: Counter({'a': 4, 'b': 2, 'g': 2, 'f': 2, ' ': 1, 'c': 1, 'e': 1, 'd': 1, '-': 1, '/': 1, '5': 1}) != {'a': 4, 'c': 1, 'b': 2, 'e': 1, 'd': 1, 'g': 2, 'f': 2}

----------------------------------------------------------------------
Ran 4 tests in 0.000s

FAILED (failures=1)
An exception has occurred, use %tb to see the full traceback.

SystemExit: True
```

If all of your tests pass, you will see an ending `OK`. The output should look similar to the following:

```python
In [1]: run tests
..
----------------------------------------------------------------------
Ran 2 tests in 0.000s

OK
```

Try adding some test functions of your own to make the function you write more robust.    
