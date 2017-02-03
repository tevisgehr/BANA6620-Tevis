num1 = int(raw_input("Input a number:> "))
num2 = int(raw_input("Input another number:> "))


my_list = [0]

for x in range(2,num1):
    if x % num2 == 0:
        my_list.extend([x])

print my_list
