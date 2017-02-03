#### Homework 8

### Part 1

One of the items we have jumped over, but that you will see in the documentation and books regarding python is a topic known as dictionary and list comprehensions.  These are nice ways of doing `for` loops that are clear and concise.  Let's look at how a list comprehension changes the way we write our traditional for loops:

```python
def square(lst):
    '''
    In: List of numbers (ints or floats)
    Out: List of squares of numbers
    '''
    sqrs = []
    for num in lst:
        sqrs.append(num**2)
    return sqrs

def square(lst):
    '''
    In: List of numbers (ints or floats)
    Out: List of squares of numbers
    '''
    return [num**2 for num in lst]    
```

A few items worth noting about the above:

1. The above functions do exactly the same thing.

```python

```

2. Notice the document string, frequently called a 'doc string'.  For any function you write, you should include a document string that tells a user about the input arguments, as well as what they can expect returned from the function.

3. We were able to write a much more concise version of our `for` loop using the list comprehension, and it is also the case that our list comprehension will run faster (only slightly) than our original method.  

We can do similar looping constructs with [dictionaries](http://stackoverflow.com/questions/1747817/create-a-dictionary-with-list-comprehension-in-python).  We will put these to practice, as well as the basic use of functions in this homework.

1. Write a function that takes a list of values and returns a list of the same values squared only if they are odd.

```python
def sqr_odd(lst):
    '''
    In: lst of numeric or float values
    Out: lst of square of original values if odd
    '''
    lst2 = []
    for val in lst:
        if val % 2 != 0:
            lst2.append(val**2)
    return lst2
```

2. Take the above question and solve it, but use a list comprehension.

```python
def sqr_odd(lst):
    '''
    In: lst of numeric or float values
    Out: lst of square of original values if odd
    '''
    return [val**2 for val in lst if val % 2 != 0]
```


3. Use a timer to see which of your functions is faster.

```python
import timeit
import numpy as np

t1 = timeit.Timer('sqr_odd([1,2,3,4,5])',

setup="""
def sqr_odd(lst):
    lst2 = []
    for val in lst:
        if val % 2 != 0:
            lst2.append(val**2)
    return lst2""")

t2 = timeit.Timer('sqr_odd([1,2,3,4,5])',

setup="""
def sqr_odd(lst):
    return [val**2 for val in lst if val % 2 != 0]""")

In [33]: np.mean(t1.repeat(10))
Out[33]: 1.1480334281921387


In [34]  np.mean(t2.repeat(10))
Out[34]: 1.0838502883911132

'''
We can see the second of our two functions (the one with the list comprehension is marginally faster.  With a larger dataset, this may have a dramatic impact on our run time.)
'''
```

4. Fill in the following function:

```python
'''
There are two potential solutions provided - you might have another solution that I did not provide.
'''

from collections import Counter

def count_characters(string):
    '''
    INPUT: STRING
    OUTPUT: DICT (STRING => INT)
    Return a dictionary which contains a count of the number of times each
    character appears in the string.
    Characters which would have a count of 0 should not need to be included in
    your dictionary.
    '''
    return Counter(string)

def count_characters(string):
    dct = Counter()
    for char in string:
        dct[char] += 1
    return dct
```

5. Write a function to assist with the following:

```python
'''
In genetics the reverse complement of a sequence is formed by reversing the sequence and then taking the complement of each symbol.

The four nucleotides in DNA is Adenine (A), Cytosine (C), Guanine (G) and Thymine (Thymine).

A is the complement of T
C is the complement of G.
This is a bi-directional relation so:

T is the complement of A
G is the complement of C.
For this kata you need to complete the reverse complement function that take a DNA string and return the reverse complement string.

Note: You need to take care of lower and upper case. And if a sequence contains some invalid characters you need to return "Invalid sequence".
'''

def nucleotide_complement(string):
    new_nuc = []
    for val in string.lower():
        if val not in 'acgt':
            return 'Invalid Input'
        if val == 'a':
            new_nuc.append('t')
        if val == 'c':
            new_nuc.append('g')
        if val == 't':
            new_nuc.append('a')
        if val == 'g':
            new_nuc.append('c')
    return ''.join([nuc.upper() for nuc in new_nuc])

```

6. Finally, we would like a function to perform the following:

```python
'''
Your task is to write function which takes string and list of delimiters as an input and returns list of strings/characters after splitting given string.

Example:

multiple_split('Hi, how are you?', [' ']) => # [Hi,', 'how', 'are', 'you?']
multiple_split('1+2-3', ['+', '-']) => ['1', '2', '3']
'''
def multiple_split(string, delimiters):
    for d in delimiters:
        string = string.replace(d, ' ')
    return [val for val in string.split()]
```
7. Write a function that takes a number, `n` and returns a string of numbers from 0 to `n` separated by a space.

```python
def string_nums(n):
    return ' '.join([str(num) for num in range(n+1)])
______
