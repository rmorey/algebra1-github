"""
This is the integer addition problem with x's, - jx + - kx= l
only working with negative numbers.
Distractors are less lame: some around right answer, some around |right answer|.
to work with the visual calculator, domain is restricted to |j| , |k|, <= 10

"""



attach yaml_format.sage

myFile = open('algebra1.ch0.sec1.top12.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top12.txt','a')

def calculate_sum_of_negative_integers(j,k):
    l = j+k
    return [l, [abs(l), abs(l)+1, abs(l)-1, -j+k, j-k, l+1, l-1]]

def wrapper():
    for j in range(-10,0):
    	for k in range(-10,0):
	    [answer,distractors]= calculate_sum_of_negative_integers(j,k)
	    answer_list= make_answer_list(answer,distractors,3)
	    if answer_list:
	       [question_string,answer_list_strings]=format_sum_of_negative_integers([j,k],answer_list)
	       insert_html_html_multiple_question("Calculate the sum",question_string,answer_list_strings,myFile)
    myFile.close()

def format_sum_of_negative_integers(list,answer_list):
    answer_list_strings= ["\("+ latex(element*x)+ "\)" for element in answer_list]
    j = list[0]
    k = list[1]
    question_string = "\(" + latex(j*x) + "+" +  latex(k*x) + "\)"
    return [question_string,answer_list_strings]


"""
    if j == 0:
       return ["{first_number}+{second_number}x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    elif j == -1 and k != -1: 
       return ["-x + {second_number}x ".format(second_number=list[1]),answer_list_strings]
    elif j != -1 and k == -1:
       return ["{first_number}x + -x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    elif j == -1 and k == -1:
       return ["-x + -x", answer_list_strings]
    elif j == 1 and k != 1: 
       return ["x + {second_number}x ".format(second_number=list[1]),answer_list_strings]
    elif j != 1 and k == 1:
       return ["{first_number}x + x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    elif j == 1 and k == 1:
       return ["x + x", answer_list_strings]
    else:
       return ["{first_number}x +{second_number}x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
"""