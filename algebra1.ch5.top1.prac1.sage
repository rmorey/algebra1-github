'''
5.1.1
given slope and y-intercept, write an equation of the line in slope-intercept form
author: rmorey
'''

attach yaml_format.sage
import random
import time

QUESTIONSET_FILENAME = "algebra1.ch5.top1.prac1.yml"
INSTRUCTION_STRING = "Find the equation of a line with a slope of \(m\) and given y-intercept."
NUMBER_OF_DISTRACTORS = 3
EQUATION_SET = create_set_of_linear_equations(6)
print(str(len(EQUATION_SET)) + " equations in set")
PROPORTION = 200.0/len(EQUATION_SET)

y = var('y')

questionsetFile = open(QUESTIONSET_FILENAME,"w")
create_html_html_multiple_question_set(questionsetFile)
questionsetFile.close()
questionsetFile = open(QUESTIONSET_FILENAME,"a")

def wrapper_5_1_1():
	question_count = 0
	start = time.time()
	for equation in EQUATION_SET:
		if random.random() < PROPORTION and equation.slope() != 'undefined':
			[answer,distractor_list] = find_solution(equation)
			answer_list = make_answer_list(answer,distractor_list,NUMBER_OF_DISTRACTORS)
			if answer_list:
				[question_string,answer_list_strings] = format_solution(answer_list,equation)
				insert_html_html_multiple_question(INSTRUCTION_STRING,question_string,answer_list_strings,questionsetFile)
				question_count += 1
	end = time.time()
	questionsetFile.close()
	print(str(question_count) + " questions written to " + QUESTIONSET_FILENAME + " in " + str(round(end - start)) + " seconds.")
		
def find_solution(equation):
	answer = equation.slope_intercept_form()
	distractor_list = []
	for slope_multiplier in [-1,1]:
		for intercept_multiplier in [-1,1]:
			for swap in [(x,1),(1,x)]:
				distractor = (y == slope_multiplier*equation.slope()*swap[0] + intercept_multiplier*equation.y_intercept()*swap[1])
				distractor_list.append(distractor)
	return [answer, distractor_list]
		
def format_solution(answer_list,equation):
	question_string = "\[m = " + latex(equation.slope()) + " \]  y-intercept = " + latex(equation.y_intercept())
	answer_list_strings = ["\(" + latex(answer) + "\)" for answer in answer_list]
	return [question_string,answer_list_strings]