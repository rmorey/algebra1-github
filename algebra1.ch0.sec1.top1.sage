"""
This is the simplest integer addition problem, j + k = l
only working with non-negative numbers.
Lame distractors, but whatever.
to work with the visual calculator, domain is restricted to |j| , |k|, <= 10
fixes: there shouldn't be any negative numbers as distractors.
"""



attach yaml_format.sage

myFile = open('algebra1.ch0.sec1.top1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top1.1.txt','a')



def calculate_sum_of_whole_numbers(j,k):
    l = j+k
    return [l, [l-3,l-2,l-1,l+1,l+2]]

def wrapper():
    for j in range(11):
    	for k in range(11):
	    [answer,distractors]= calculate_sum_of_whole_numbers(j,k)
	    answer_list= make_answer_list(answer,distractors,3)
	    if answer_list:
	       [question_string,answer_list_strings]=format_sum_of_whole_numbers([j,k],answer_list)
	       insert_html_html_multiple_question("Calculate the sum",question_string,answer_list_strings,myFile)
    myFile.close()

def format_sum_of_whole_numbers(list,answer_list):
    answer_list_strings= [str(element) for element in answer_list]
    return ["{first_number}+{second_number}".format(first_number=list[0], second_number=list[1]),answer_list_strings]