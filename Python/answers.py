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
