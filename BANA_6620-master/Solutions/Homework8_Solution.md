### Homework 8 Solution

Notice this solution represents a single representation for a possible solution.  There are frequently many ways to write the solution to a particular problem.  In order to choose a 'best' solution, we should consider the computational necessities in terms of speed and storage.

1. Write a script that obtains the count of a user inputted letter in a user inputted string. Make sure to build this in such a way that it ignores the case of the inputted string and letter.

```python
def letter_counter(input_string, letter):
    holder = input_string.lower()
    return holder.count(letter)
```
2. Write a script that creates a list of only the even numbers between 0 and a user inputted number.

```python
def evens(use_num):
    holder = []
    vals = range(use_num + 1)
    for val in vals:
        if val % 2 == 0:
            holder.append(val)
    return holder
```

3. Write a script that creates a list of only numbers divisible by a user inputted number that are between 0 and a user inputted number.

```python
def evens(use_num, div_num):
    holder = []
    vals = range(use_num + 1)
    for val in vals:
        if val % div_num == 0:
            holder.append(val)
    return holder
```

4. Write a function that takes in two lists and returns a sorted list of the common elements.

```python
def common_els(lst1, lst2):
    set1 = set(lst1)
    set2 = set(lst2)
    return list(set1 & set2).sort()    
```

5. Write a script that takes a user inputted number and prints whether it is positive, negative or zero, with "The inputted number is (positive/negative/zero)".

```python
def direction(use_num):
    if use_num > 0:
        return "The inputted number is positive"
    if use_num < 0:
        return "The inputted number is negative"
    if use_num == 0:
        return "The inputted number is zero"
```

6. Write a script that takes two user inputted numbers and prints "The first number is larger" or "The second number is larger" depending on which is larger.

```python
def whichislarger(num1, num2):
    if num1 > num2:
        return "The first number is larger"
    if num2 > num1:
        return "The second number is larger"
    else:
        return "They are equal"
```

7. Write a function that takes a number, and computes the sum from 0 to a the number.

```python
def sumnums(use_num):
    return sum(range(use_num+1))
```
