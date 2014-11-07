"""
this is one-step solving for x, addition
x + j = k
"""

attach yaml_format.sage
import random

myFile = open('algebra1.ch3.sec2.top1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch3.sec2.top1.txt','a')

def solve_for_x(j,k):
    x = k - j
    return [x, [j+k, -x, k, -k, j, -j]]

r = range(-10,11)
r.remove(0)

def wrapper():
    for j in r:
    	for k in range(-10,11):
			[answer,distractors]= solve_for_x(j,k)
			answer_list= make_answer_list(answer,distractors,3)
			if answer_list:
				[question_string,answer_list_strings]=format_solve_for_x_addition(j,k,answer_list)
				insert_html_html_multiple_question("Solve for x",question_string,answer_list_strings,myFile)
    myFile.close()

def format_solve_for_x_addition(j,k,answer_list):
	answer_list_strings= ['\( '+latex(element)+' \)' for element in answer_list]
	style = random.randint(1,4)
	if style == 1:
		question_string = '\[ '+ 'x \; + \;' + latex(j) +'\; = \;' +latex(k) + '\]'
	elif style == 2:
		question_string = '\[ '+ 'x \; - \;' + latex(k) +'\; = \;' +latex(j) + '\]'
	elif style == 3: 
		question_string = '\[ '+ latex(k) +'\; = \;' +'x \; - \;' + latex(j) + '\]'
	elif style == 4:
		question_string = '\[ '+ latex(j) +'\; = \;' +'x \; - \;' + latex(k) + '\]'
	return [question_string,answer_list_strings]
