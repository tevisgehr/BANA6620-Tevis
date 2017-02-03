from sys import argv

script, input_string, input_letter = argv
letter_count = 0

for letter in input_string:
    if letter.lower() == input_letter.lower():
        letter_count += 1

print "The letter %s occurs %r time(s) in your string." %(input_letter, letter_count)
