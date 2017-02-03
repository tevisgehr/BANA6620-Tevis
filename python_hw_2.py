num = int(raw_input("Input a number:> "))

my_list = [0]

for x in range(2,num):
    if x % 2 == 0:
        my_list.extend([x])

print my_list
