'''
this is one-step solving for x, division
presented in 4 ways 
x/j = k
k = x/j
(1/j)*x = k
k = (1/j)*x

ranges:
j -10 to 10 excluding 0
k -10 to 10
'''

attach yaml_format.sage
import random

myFile = open('algebra1.ch3.top1.prac4.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch3.top1.prac4.txt','a')

def solve_for_x_one_step_division(j,k):
    x = j*k
    return [x, [-x, j*(k+1), -k*(j+1), j*(k+1), -k*(j-1)]]
	
def format_solve_for_x_one_step_division(j,k,answer_list):
	answer_list_strings= ['\( '+latex(element)+' \)' for element in answer_list]
	
	style = random.randint(1,4)
	if style == 1:
		question_string = '\[ \\frac{'+ latex(x) + '}{' + latex(j) + '} = ' + latex(k) + '\]'
	elif style == 2:
		question_string = '\[ ' + latex(k) + ' = \\frac{' + latex(x) + '}{' + latex(j) + '} \]'
	elif style == 3: 
		question_string = '\[ \\frac{1}{' + latex(j) + '} \cdot ' + latex(x) + ' = ' + latex(k) + ' \]'
	elif style == 4:
		question_string = '\[ ' + latex(k) + ' = \\frac{1}{' + latex(j) + '} \cdot ' + latex(x) + ' \]'
	return [question_string,answer_list_strings]
	

j_range = range(-10,11)
j_range.remove(0)
k_range = range(-10,11)

proportion = 200.0/(len(j_range)*len(k_range))

def wrapper():
	question_count = 0
	for j in j_range:
		for k in k_range:
			if random.random() < proportion:
				[answer,distractors]= solve_for_x_one_step_division(j,k)
				answer_list= make_answer_list(answer,distractors,3)
				if answer_list:
					[question_string,answer_list_strings]=format_solve_for_x_one_step_division(j,k,answer_list)
					insert_html_html_multiple_question("Solve for \(x\)",question_string,answer_list_strings,myFile)
					question_count += 1
	myFile.close()
	print question_count


