'''
this is 2-step solving for x, multiplication	
presented in 8 ways:
a*x + b = c
a*x - (-b) = c
b + a*x = c
b - (-a*x) = c
and all of the above with c at the front

a:-10 to 10 excluding 0
x:-10 to 10
b:-10 to 10 excluding 0
x = (c-b)/a
'''

attach yaml_format.sage
import random

myFile = open('algebra1.ch3.top2.prac1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch3.top2.prac1.txt','a')

def solve_for_x_two_step_multiplication(a,x,b,):
	c = a*x + b
	distractors = [(c+b)/a, (c-b)*a, (b-c)/a, -x, c-b, b-c]
	return [x, distractors, c]
	
def format_solve_for_x_two_step_multiplication(a,b,c,answer_list):
	answer_list_strings = ["\( " + latex(element) + "\)" for element in answer_list]
	style = random.randint(1,8)
	if style == 1:
		question_string = "\[ " + latex(a*x) + "\; + \;" + latex(b) + " = " + latex(c) + " \]"
	if style == 2: 
		question_string = "\[ " + latex(a*x) + "\; - \;" + latex(-1*b) + " = " + latex(c) + " \]"
	if style == 3: 
		question_string = "\[ " + latex(b) + "\; + \;" + latex(a*x) + " = " + latex(c) + " \]"
	if style == 4: 
		question_string = "\[ " + latex(b) + "\; - \;" + latex(-1*a*x) + " = " + latex(c) + " \]"
	if style == 5: 
		question_string = "\[ " + latex(c) + " = " + latex(a*x) + "\; + \;" + latex(b) + " \]"
	if style == 6: 
		question_string = "\[ " + latex(c) + " = " + latex(a*x) + "\; - \;" + latex(-1*b) + " \]"
	if style == 7:
		question_string = "\[ " + latex(c) + " = " + latex(b) + "\; + \;" + latex(a*x) + " \]"
	if style == 8:
		question_string = "\[ " + latex(c) + " = " + latex(b) + "\; - \;" + latex(-1*a*x) + " \]"
	return [question_string,answer_list_strings]
	
a_range = range(-10,10)
x_range = range(-10,10)
b_range = range(-10,10)
a_range.remove(0)
b_range.remove(0)

proportion = 200.0/(len(a_range)*len(x_range)*len(b_range))
print str(len(a_range)*len(x_range)*len(b_range)) + " possible questions"

def wrapper():
	question_count = 0
	for a in a_range:
		for x in x_range:
			for b in b_range:
				if random.random() < proportion:
					[answer,distractors,c]= solve_for_x_two_step_multiplication(a,x,b)
					answer_list= make_answer_list(answer,distractors,3)
					if answer_list:
						[question_string,answer_list_strings]=format_solve_for_x_two_step_multiplication(a,b,c,answer_list)
						insert_html_html_multiple_question("Solve for \(x\)",question_string,answer_list_strings,myFile)
						question_count += 1
	myFile.close()
	print str(question_count) + " questions printed to file"