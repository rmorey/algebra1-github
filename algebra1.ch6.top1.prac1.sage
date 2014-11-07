'''
This is plotting inequalities statement to line
question presents an inequality plotted line
x > a
a < x
'''

attach yaml_format.sage
import random
import time

myFile = open('algebra1.ch6.top1.prac1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch6.top1.prac1.txt','a')

def opposite(sign):
	if sign == ">": return "<"
	if sign == "<": return ">"
	if sign == ">=": return "<="
	if sign == "<=": return ">="
	if sign == "\leq": return "\geq"
	if sign == "\geq": return "\leq"

def wrong_circle(sign):
	if "=" in sign: 
		return sign[0]
	else:
		return sign + "="
		
def latex_sign(sign):
	if sign == "<=": return "\leq"
	if sign == ">=": return "\geq"
	else: return sign
		
def plot_inequality_line_to_statement(a,sign):
	answer = 'x' + sign + str(a)
	distractors = []
	for sign_choice in [sign, opposite(sign), wrong_circle(sign), opposite(wrong_circle(sign))]:
		for number_choice in [str(a), str(-a)]:
			distractors.append('x' + sign_choice + number_choice)
	return [answer, distractors]
		
def format_plot_inequality_line_to_statement(a,sign,answer_list):
	if random.random() < 0.5:
		question_string = "\[ x" + latex_sign(sign) + latex(a) + "\]"
	else:
		question_string = "\[" + latex(a)+opposite(latex_sign(sign)) + " x \]"
	answer_list_strings = []
	for answer_string in answer_list:
		try: 
			svg_file = open('graphics/' + answer_string + '.svg')
		except IOError:
			numberLine = number_line() 
			numberLine.graph([answer_string])
			plt.savefig('graphics/' + answer_string + '.svg', format='svg')
			numberLine.clear()
			svg_file = open('graphics/' + answer_string + '.svg')
		svg_string = svg_file.read()
		svg_string = svg_string.replace('height="432pt" viewBox="0 0 576 432"', 'height="100pt" viewBox="40 108 530 216" preserveAspectRatio="xMinYMid slice"')
		answer_list_strings.append("|\n      " + svg_string.replace('\n',''))
		svg_file.close()
	return [question_string,answer_list_strings]
	
def wrapper():
	question_count = 0
	time_start = time.time()
	for a in IntegerRange(-10,11):
		for sign in [">", ">=", "<", "<="]:
			[answer,distractors] = plot_inequality_line_to_statement(a,sign)
			answer = str(answer)
			distractors = [str(element) for element in distractors[:]]
			answer_list = make_answer_list(answer,distractors,3)
			if answer_list:
				[question_string,answer_list_strings]=format_plot_inequality_line_to_statement(a,sign,answer_list)
				insert_html_html_multiple_question("Choose the numberline that corresponds to the inequality shown",question_string,answer_list_strings,myFile)
				question_count += 1
	myFile.close()
	time_end = time.time()
	print str(question_count) + " questions printed to file in " + str(int(time_end) - int(time_start)) + " seconds."