
"""
simple whole number division with whole answers

"""

attach yaml_format.sage
import random

myFile = open('algebra1.ch0.sec1.top9.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top9.txt','a')

def calculate_quotient_of_integers(j,k):
    l = j*k
    return [j, [l+k, abs(l-k), l*k, j+1, j-1, l]]

def wrapper():
	for j in range(11):
    		for k in range(1,11):
			[answer,distractors]= calculate_quotient_of_integers(j,k)
			if answer:
				answer_list= make_answer_list(answer,distractors,3)
				if answer_list:
					[question_string,answer_list_strings]=format_quotient_of_integers([j*k,k],answer_list)
					insert_html_html_multiple_question("Calculate the quotient",question_string,answer_list_strings,myFile)
	myFile.close()

def format_quotient_of_integers(list,answer_list):
    answer_list_strings= [latex(element) for element in answer_list]
    format = random.randint(1,5)
    if format == 1:
       return ["\[ {first_number} \over {second_number} \]".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    if format == 2:
       return ["\[ {first_number}/{second_number} \]".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    if format == 3:
       return ["\[ {first_number} \div {second_number} \]".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    if format == 4:
       return ["\[ {first_number} \cdot  \\frac{{1}}{{{second_number}}}  \]".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    if format == 5:
       return ["\[ \\frac{{1}}{{{second_number}}} \cdot {first_number} \]".format(first_number=list[0], second_number=list[1]),answer_list_strings]
    if format == 6:
       if (list[0]/abs(list[0]))/(list[1]/abs(list[1])) == -1:
       	  sign = "-" 
       elif (list[0]/abs(list[0]))/(list[1]/abs(list[1])) == 1:
       	  sign = " "
       return ["\[ "+sign+ " \\frac{{{abs_first_number}}}{{{abs_second_number}}} \]".format(abs_first_number=abs(list[0]),abs_second_number=abs(list[1])),answer_list_strings]
   
