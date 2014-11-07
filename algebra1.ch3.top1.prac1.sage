"""
this is one-step solving for x, addition
presented in 4 ways 
x + j = k
k = x + j
j + x = k
k = j + x

ranges:
j -10 to 10 excluding 0
k -10 to 10

"""

attach yaml_format.sage
import random

myFile = open('algebra1.ch3.top1.prac1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch3.top1.prac1.txt','a')

def calculate_solve_for_x_addition(j,k):
    x = k-j
    return [x, [-x, x+1, x-1, k+j, -(k+j)]]

j_range = range(-10,11)
j_range.remove(0)
k_range = range(-10,11)

def wrapper():
    for j in j_range:
    	for k in k_range:
			[answer,distractors]= calculate_solve_for_x_addition(j,k)
			answer_list= make_answer_list(answer,distractors,3)
			if answer_list:
				[question_string,answer_list_strings]=format_solve_for_x_addition(j,k,answer_list)
				insert_html_html_multiple_question("Solve for \(x\)",question_string,answer_list_strings,myFile)
    myFile.close()

def format_solve_for_x_addition(j,k,answer_list):
	answer_list_strings= ['\( '+latex(element)+' \)' for element in answer_list]
	
	style = random.randint(1,4)
	if style == 1:
		question_string = '\[ '+ 'x \; + \;' + latex(j) + '\; = \;' + latex(k) + '\]'
	elif style == 2:
		question_string = '\[ '+ latex(j) + '+ x' + '=' + latex(k) + '\]'
	elif style == 3: 
		question_string = '\[ '+ latex(k) +'\; = \;' +'x \; + \;' + latex(j) + '\]'
	elif style == 4:
		question_string = '\[ '+ latex(k) + '= \;' + latex(j) + '+ x' + ' \]'
	
	return [question_string,answer_list_strings]
