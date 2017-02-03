#### Assessment 2

This exam is written to have both fairly trivial questions, as well as very difficult questions.  The exam is meant to challenge even students who have a very strong grasp of the material.  Interviews involving SQL frequently will ask some very simple, as well as very in depth questions regarding how to query data.

##### Part 1

1. Consider I run the following in python

```python
In [1]: import pandas as pd

In [2]: df = pd.read_csv('data/my_data.csv')

In [3]: df.head(5)
Out[3]:
     dt    | userid | meal_id | event  
-----------|--------|---------|--------
2013-01-01 |      3 |      18 | bought
2013-01-01 |      7 |       1 | like
2013-01-01 |     10 |      29 | bought
2013-01-01 |     11 |      19 | share
2013-01-01 |     15 |      33 | like

```
Provide code to obtain a count for how many times each `event` type occurred using python.  

2. Write SQL code to perform the same action you performed above in python.

3. Write a function that takes in three lists, and it returns one dictionary of how often a word occurs across all the lists.

4. Write a function that takes in three lists, and returns a dictionary containing each word as a key, and the number of lists the word occurs in as the value.  If a word occurs in a single list more than once, this only counts as a single count for that list.  The order of the below may change, but here is an example:

```python
In [1]: lst1 = ['hey', 'hi', 'when', 'Hi']

In [2]: lst2 = ['Hi', 'hi', 'hey', 'yes', 'no']

In [3]: lst3 = ['hello', 'when', 'when', 'when']

In [4]: my_fun(lst1, lst2, lst3)
Out[4]: {'hey': 2, 'hi', 2, 'when': 2, 'yes': 1, 'no': 1, 'hello': 1}
```

5. Extra Credit 1: Now extend this another step to take in an arbitrary number of lists, and return the number of lists a word appears in.

6. Extra Credit 2: Write a `unittest` to test your functions for 3 through 5.  

##### Part 2


1. Describe a python `dictionary` data structure.  What is true about the keys and values of this data structure?  When are you likely to see one or use one?

2. Describe why you might use a `numpy array` vs. a `list`, and vice-versa - why might you use a `list` rather than a `numpy array`.

3. Describe the difference between `git` and `Github`.  For full credit you must explicitly describe the primary purpose of each.

4.  Provide 5 of your favorite linux commands, and when you use them in practice.

5. What are the three principles surrounding classes in python?  Beyond these principles, what other ideas come to mind about writing classes in python?

6. If you have a data structure in python you have never worked with before, describe the process you would go through to better understand the object.  
