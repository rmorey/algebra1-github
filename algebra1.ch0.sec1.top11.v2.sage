"""
This is addition with variables. This problem set includes 3 types of problems 
j*x + k*x = l*x
j + k*x = j + k*x
j*x + k = j*x + k
j and k  both range from -10 to 10, inclusive


"""



attach yaml_format.sage
import random

myFile = open('algebra1.ch0.sec1.top11.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top11.txt','a')



def calculate_sum_of_terms(first_coefficient,first_variable,second_coefficient,second_variable):
    if first_variable == 1 and second_variable == 1: first_variable,second_variable = x,x   
    first_term = first_coefficient*first_variable
    second_term = second_coefficient*second_variable
    sum = first_term + second_term
    distractors = [first_coefficient + second_coefficient, first_coefficient*x + second_coefficient*x, -sum, first_term - second_term, first_coefficient*second_variable + second_coefficient*first_variable]
    return [sum, distractors,first_term,second_term]


def wrapper():
    for first_coefficient in range(-10,11):
    	for second_coefficient in range(-10,11):
	    first_variable = random.choice([x,1])
	    second_variable = random.choice([x,1])
	    [answer,distractors,first_term,second_term]= calculate_sum_of_terms(first_coefficient,first_variable,second_coefficient,second_variable)
	    if answer:
	       answer_list= make_answer_list(answer,distractors,3)
	       if answer_list and random.choice([0,1]):
	       	  [question_string,answer_list_strings]=format_sum_of_terms(first_term,second_term,answer_list)
		  insert_html_html_multiple_question("Calculate the sum",question_string,answer_list_strings,myFile)
    myFile.close()

def format_sum_of_terms(first_term,second_term,answer_list):
    answer_list_strings = ['\('+latex(element)+ '\)'  for element in answer_list]
    question_string = '\(' + latex(first_term) + '+' +  latex(second_term) + '\)'
    return [question_string, answer_list_strings]


