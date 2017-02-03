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
