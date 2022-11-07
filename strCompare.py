# STRING COMPARER
# especially useful when you're comparing log messages

import difflib 

# input string 1
string1 = input("Enter String 1 : ")

# input string 2
string2 = input("Enter String 2 : ")

print("\nComparing......... ", " - " + "String 1", " + " + "String 2\n", sep='\n')

# use diflib for difference and similarity check
d = difflib.Differ()
s = difflib.SequenceMatcher(None, string1, string2).ratio()

# compare string
diff = d.compare(string1.split(), string2.split())

# print result
print("The similarity ratio is: " + str(s) + "\n")
print ('\n'.join(diff))
