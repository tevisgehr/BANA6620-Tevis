#### Introduction to Functions in Python

In the last set of notes, we introduced data structures, logic, and control flow in python.  These are concepts that are necessary to master before diving deeper into programming.  The aim for this set of notes is to gain a better understanding of how to write functions in python.

Often the things that we interact with in other coding environments or python are functions that have already been built by other programmers.  However, you might need to build functions of your own in the case one does not exist for a problem you are trying to solve.

When writing our own functions, python starts all functions with `def` followed by the name of our function.  The purpose of functions is two-fold:

1. Abstraction: Allowing a user to perform an operation without knowing all the details of what is happening under the hood.  The same way a user operates a vehicle without having to know everything about how the vehicle works, we can write code in this same way.

2. Reproducibility: Allowing us to perform the same action many times, more quickly than if we had to re-write all our code again.  

As an example imagine we are interested in creating a function `repeat_sum` that allows a user to sum the common values across three lists (or potentially an undefined number of lists).  We might want to use the function in the following way:

```python
repeat_sum([[1, 2, 3],[2, 8, 9],[7, 123, 8]])
return 10


repeat_sum([[1], [2], [3, 4, 4, 4], [123456789]])
return 0

repeat_sum([[1, 8, 8], [8, 8, 8], [8, 8, 8, 1]])
return 9
```

We will walk through the process of creating functions step by step by creating the `repeat_sum` function from scratch.  For what is worth, I am not sure that a function like this exists, so this is a perfect of example of why it is important to be able to write your own functions in python.  It allows you the flexibility of creating functionality for our individual situations.

First, we should create our function definition.  Essentially, we define the function, and we specify the input argument(s) - just a single list in this instance.  As a side note, it is considered bad practice to name a variable an argument.  This certainly leads to confusion, and harder to read code.  

```python
def repeat_sum(lst):
    pass
```

Now we need a way to determine if a value appears in more than a single list.  In order to perform this task, we might use `set` on each list.  Then adding all the sets to a single list, will allow us to have each value in a list only show up uniquely.  Then the number of lists a value will show up is determined based on the frequency of how often a number shows up in the final list.

```python
def repeat_sum(lst):
    lsts = []
    for in_lst in lst:
        lsts.extend(set(in_lst))    
```

The built in `Counter` is very useful.  As shown below, it provides us with a dictionary of each item in a list as a key, and a corresponding value of how often a particular item exists in the list.

```python
from collections import Counter

def repeat_sum(lst):
    lsts = []
    for in_lst in lst:
        lsts.extend(set(in_lst))
    dct = Counter(lsts)
```

As a final step, I want to return the key if the value is greater than 1 and sum all the keys.

```python
from collections import Counter

def repeat_sum(lst):
    lsts = []
    for in_lst in lst:
        lsts.extend(set(in_lst))
    dct = Counter(lsts)
    final_lst = []
    for k, v in dct.iteritems():
        if v > 1:
            final_lst.append(k)
    return sum(final_lst)
```

Now someone else might write an alternative solution.  How do we determine which implementation is 'better'?  Really, from a computing stand point, your code is better based on two criteria:

1. Computational complexity: More complexity means that it will take longer to run - this is not good.

2. Space: The less space your function will take to operate, the better.

Runtime is tested via [Big O Notation](http://web.mit.edu/16.070/www/lecture/big_o.pdf) in a generic sense.  Specific to python, we can use the library `timeit`.  Let's consider what this looks like in comparing two implementations of the same function.  Here is a second version of this function:

```python
from collections import defaultdict

def repeat_sum2(l):
    count = defaultdict(int)
    for l1 in l:
        for val in set(l1):
            count[val] += 1

    return sum(k for k,v in count.items() if v > 1)
```

Here is how we can look at the runtime of each function.  For specifics, please take a look at the `Timer` functionality using `?`.  We instantiate an object for each of our tests.

```python

import timeit

t1 = timeit.Timer('repeat_sum([[1, 2, 3],[2, 8, 9],[7, 123, 8]])',

setup="""
from collections import Counter

def repeat_sum(lst):
    lsts = []
    for in_lst in lst:
        lsts.extend(set(in_lst))
    dct = Counter(lsts)
    final_lst = []
    for k, v in dct.iteritems():
        if v > 1:
            final_lst.append(k)
    return sum(final_lst)""")


t2 = timeit.Timer('repeat_sum2([[1, 2, 3],[2, 8, 9],[7, 123, 8]])',

setup="""
from collections import defaultdict

def repeat_sum2(l):
    count = defaultdict(int)
    for l1 in l:
        for val in set(l1):
            count[val] += 1

    return sum(k for k,v in count.items() if v > 1)""")

```

Then we can look at the run time of multiple runs of each function to see how well each performs on multiple occurrences.  

```python
In [23]: print t1.repeat(10)
Out[23]:
[10.250789880752563,
 11.411423921585083,
 11.863148927688599,
 11.911715030670166,
 11.08260989189148,
 11.43059492111206,
 11.58208703994751,
 10.906582832336426,
 10.465823888778687,
 10.720420837402344]

In [24]: print t2.repeat(10)
Out[24]:
[6.767291069030762,
 6.843967914581299,
 6.675554990768433,
 6.619117975234985,
 6.5509419441223145,
 6.446743011474609,
 6.253304958343506,
 6.09475302696228,
 6.283176898956299,
 6.20072603225708]
```

On average, we can see that the second implementation offers some pretty substantial speed gains.

```python
In [25]: import numpy as np

In [26]: np.mean(_23) - np.mean(_24)
Out[26]: 5.1391982316970832
```
As we perform this operation with more data, these speed gains will grow more and more substantial.

As a final note, we can always get more practice using [codewars](https://www.codewars.com/) and [hackerrank](https://www.hackerrank.com/) problems.  Let google be your friend, but I am also around to help.  Much of this space is learning enough about the foundation that you can start to trouble shoot your own problems.  It takes time, persistence, and patience to be come strong programmer.

______

#### Additional Notes

I will point to the 'Good Code' guide.  You should be using  [PEP](https://www.python.org/dev/peps/pep-0008/) as something to strive for in writing good code.  Your code should be readable and well documented.  You want other users (where that is commonly future you) to be able to follow your code.  `Use snake case with functions, use camel case with classes, write document strings, use good naming conventions, use proper indentation, and always strive to write simple elegant solutions where possible` - Cary G.  

Code wars solutions are often not readable.  Rather, they are all slammed onto a single line to gain upvotes.  You should not be writing code like this in practice.  You should be striving for the above in practice.   
