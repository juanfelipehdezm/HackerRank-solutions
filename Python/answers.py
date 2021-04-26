def Weird_noWeird():
    n = int(input("Pleas enter a number: "))
    if n % 2 != 0 or (n in range(6, 21)):
        y = "Weird"
    else:
        y = "No Weird"
    return y
# print(Weird_noWeird())


def the_second_posi(an_array):
    # Find the second best position of the arrray or list.
    no_first = [i for i in an_array if i < max(an_array)]
    return max(no_first)
#print(the_second_posi([13, 22, 324, 24, 235, 5454, 64]))


def second_worst():
    """Given the names and grades for each student in a class of  students, store them in a nested list and print the name(s) of any student(s) 
       having the second lowest grade."""
    # this block of code is to create the nested list
    students = list()
    for _ in range(int(input("Number of students: "))):
        name = input("Name: ")
        score = float(input("Grade: "))
        students.append([score, name])
    students.sort()  # it sorts asc students by score
    # we took out the worst grade of the students
    withOut_first = [i for i in students if i[0] != students[0][0]]
    # we make a list of just the second worst list
    just_second = [j for j in withOut_first if j[0] == withOut_first[0][0]]
    # we print the students with the second worst list
    # as the grade is the same we sorted by name
    just_second.sort(key=lambda x: x[1])
    for _ in range(len(just_second)):
        print(just_second[_][1])
    return " "
# second_worst()


students_marks = {"Krishna": [67, 68, 69],
                  "Arjun": [70, 98, 63],
                  "Malika": [52, 56, 60]}


def mean_marks(a_name):
    """Print one line: The average of the marks obtained by the particular student correct to 2 decimal places."""

    scores = students_marks[a_name]
    total = 0
    acum = 0
    for score in scores:
        total += score
        acum += 1
    return "{:.2f}".format(total/acum)
# print(mean_marks("Malika"))


def hash_function():
    """Given an integer, N , and N space-separated integers as input, create a tuple, t , of those  integers. Then compute and print the result of hash(t)."""
    integer_list = map(int, input().split())
    my_tup = tuple([num for num in integer_list])
    return hash(my_tup)
# print(hash_function())


def split_and_join(line, x):
    """ Join the string under any X parameter you desire 
        x must be a string"""
    return x.join(line.split())
#print(split_and_join("This is a string", "-"))


def mutate_string(string, position, character):
    """ TASK
      Read a given string, change the character at a given index and then print the modified string.
        FUNCTION DESCRIPTION
      Complete the mutate_string function in the editor below.

      mutate_string has the following parameters:

      string string: the string to change
      int position: the index to insert the character at
      string character: the character to insert
      Returns string: the altered string"""
    list_string = list(string)
    list_string[position] = character
    return "".join(list_string)
#print(mutate_string("abrakadacra", 4, "8"))


def count_subString(string, sub_string):
    """In this challenge, the user enters a string and a substring. You have to print the number of times that the substring occurs in the given string."""
    string = string.upper()
    sub_string = sub_string.upper()
    appear = 0
    for i in range(0, len(string)):
        if string[i:i+len(sub_string)] == sub_string:
            appear += 1
    return "The substring appeared {} ".format(appear)
#print(count_subString("ABCDCDC", "CDc"))


def string_validator(s):
    # This method checks if all the characters of a string are alphanumeric (a-z, A-Z and 0-9).
    print(any(l.isalnum() for l in s))
    # This method checks if all the characters of a string are alphabetical (a-z and A-Z).
    print(any(l.isalpha() for l in s))
    # This method checks if all the characters of a string are digits (0-9).
    print(any(l.isdigit() for l in s))
    # This method checks if all the characters of a string are lowercase characters (a-z).
    print(any(l.islower() for l in s))
    # This method checks if all the characters of a string are uppercase characters (A-Z).
    print(any(l.isupper() for l in s))
    return ""
# print(string_validator("qA2"))


def wrap(string, max_width):
    """ You are given a string S and width w.
        Your task is to wrap the string into a paragraph of width w."""
    for i in range(0, len(string)+1, max_width):  # this FOR iterates for 4 in 4 bc of the third argument
        result = string[i:i+max_width]
        if len(result) == max_width:
            print(result)
        else:
            return result


print(wrap("ABCDEFGHIJKLIMNOQRSTUVWXYZ", 4))
