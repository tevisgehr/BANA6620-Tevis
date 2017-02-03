from sys import argv

script, input_string, input_letter = argv



print input_string
print input_letter

for letter in input_string:
    print "Current letter is: %s." % letter
