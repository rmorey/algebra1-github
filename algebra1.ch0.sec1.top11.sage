"""
This is the simplest integer addition problem with x's, j*x + k*x = l*x
only working with non-negative numbers.
Lame distractors, but whatever.
to work with the visual calculator, domain is restricted to |j| , |k|, <= 10
fixes: there shouldn't be any negative numbers as distractors.
"""



attach yaml_format.sage

myFile = open('algebra1.ch0.sec1.top11.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top11.txt','a')



def calculate_sum_of_whole_number_coefficient_variables(j,k):
    l = j+k
    return [l, [l-3,l-2,l-1,l+1,l+2]]

def wrapper():
    for j in range(11):
    	for k in range(1,11):
	    [answer,distractors]= calculate_sum_of_whole_number_coefficient_variables(j,k)
	    answer_list= make_answer_list(answer,distractors,3)
	    if answer_list:
	       [question_string,answer_list_strings]=format_sum_of_whole_number_coefficient_variables([j,k],answer_list)
	       insert_html_html_multiple_question("Calculate the sum",question_string,answer_list_strings,myFile)
    myFile.close()

def format_sum_of_whole_number_coefficient_variables(list,answer_list):
    answer_list_strings= ['\('+latex(element*x)+'\)'  for element in answer_list]
    return ['\('+latex(list[0]*x)+'+'+latex(list[1]*x)+'\)',answer_list_strings]


'''
    for element in answer_list_strings:
     	 if element == "0x":
	    index = answer_list_strings.index("0x")
	    answer_list_strings.remove("0x")
	    answer_list_strings.insert(index,"0")
	 if element == "1x":
	    index = answer_list_strings.index("1x")
	    answer_list_strings.remove("1x")
	    answer_list_strings.insert(index,"x")
    j = list[0]
    k = list[1]
    if j == 0:
       return ["{first_number}+{second_number}x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    elif j == 1 and k != 1: 
       return ["x + {second_number}x ".format(second_number=list[1]),answer_list_strings]
    elif j != 1 and k == 1:
       return ["{first_number}x + x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    elif j == 1 and k == 1:
       return ["x + x", answer_list_strings]
    else:
       return ["{first_number}x +{second_number}x ".format(first_number=list[0], second_number=list[1]),answer_list_strings]
'''