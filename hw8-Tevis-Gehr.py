

def problem1():
  from sys import argv

  script, input_string, input_letter = argv
  letter_count = 0

  for letter in input_string:
      if letter.lower() == input_letter.lower():
          letter_count += 1

  print "The letter %s occurs %r time(s) in your string." %(input_letter, letter_count)

def problem2():
    num = int(raw_input("Input a number:> "))

    my_list = [0]

    for x in range(2,num):
        if x % 2 == 0:
            my_list.extend([x])

    print my_list

def problem3():
    num1 = int(raw_input("Input a number:> "))
    num2 = int(raw_input("Input another number:> "))


    my_list = [0]

    for x in range(2,num1):
        if x % num2 == 0:
            my_list.extend([x])

    print my_list

def problem4():
    from sys import argv

    script, filename1, filename2 = argv

    with open(filename1) as f1:
        list1 = f1.readlines()
    list1 = [x.strip('\n') for x in list1]

    with open(filename2) as f2:
        list2 = f2.readlines()
    list2 = [y.strip('\n') for y in list2]

    list3 = []

    for x in list1:
        if x in list2:
            list3.extend([x])

    list3.sort()
    print list3

def problem5():
    num = float(raw_input("Input a number:>"))

    if num > 0:
        print num, " is positive."
    elif num == 0:
        print num, " is zero."
    else:
        print num, " is negative."

def problem6():
    num1 = float(raw_input("Input a number:>"))
    num2 = float(raw_input("Input another number:>"))

    if num1 > num2:
        print "The first number is larger."
    elif num1 == num2:
        print "The two numbers are equal."
    else:
        print "The second number is larger."


def problem7():
    num = int(raw_input("Input a number:>"))
    y = 0

    for x in range(1,num + 1):
        y += x

    print y
