def value_counter1(lst1,lst2,lst3):
    import pandas as pd
    s=pd.Series(lst1+lst2+lst3)
    return dict(s.value_counts())

def value_counter2(lst1,lst2,lst3):
    import pandas as pd
    s=pd.Series(list(set(lst1))+list(set(lst2))+list(set(lst3)))
    return dict(s.value_counts())

def value_counter_any_number_args(*arg):
    import pandas as pd
    big_lst =[]
    for lst in arg: big_lst.extend(list(set(lst)))
    s=pd.Series(big_lst)
    return dict(s.value_counts())

#It should be noted that these functions do differentiate by letter case.
#If we want "Hi" to be treated as equal to "hi" the we will need to use:
#x.lower() for x in lst
#for each list before the counting takes place.
