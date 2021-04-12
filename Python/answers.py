def Weird_noWeird():
    n = int(input("Pleas enter a number: "))
    if n % 2 != 0 or (n in range(6, 21)):
        y = "Weird"
    else:
        y = "No Weird"
    return y
# print(Weird_noWeird())
