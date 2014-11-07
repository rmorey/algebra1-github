'''
5.1.3
given a pair of points, write the equation of the line through it.

author: rmorey
'''

attach yaml_format.sage
import random
import time

QUESTIONSET_FILENAME = "algebra1.ch5.top1.prac3.yml"
INSTRUCTION_STRING = "Write an equation that passes through the two points shown."
EQUATION_SET = create_set_of_linear_equations(6)
PROPORTION = 200.0/len(EQUATION_SET)
NUMBER_OF_DISTRACTORS = 3

questionsetFile = open(QUESTIONSET_FILENAME,"w")
create_html_html_multiple_question_set(questionsetFile)
questionsetFile.close()
questionsetFile = open(QUESTIONSET_FILENAME,"a")

def wrapper():
	question_count = 0
	start = time.time()
	for equation in EQUATION_SET:
		if random.random() < PROPORTION and equation.slope() != 'undefined':
			[answer,distractor_list] = find_solution(equation)
			if answer:
				[question_string,answer_list_strings] = format_solution(answer,distractor_list,equation)
				answer_list = make_answer_list(answer_list_strings[0],answer_list_strings[1:],NUMBER_OF_DISTRACTORS)
				if answer_list:
					insert_html_html_multiple_question(INSTRUCTION_STRING,question_string,answer_list_strings,questionsetFile)
					question_count += 1
	end = time.time()
	questionsetFile.close()
	print(str(question_count) + " questions written to " + QUESTIONSET_FILENAME + " in " + str(round(end - start)) + " seconds.")
		
def find_solution(equation):
	answer = equation.slope_intercept_form()
	if equation.slope()==0:	a = 1
	else: a = 1
	distractor_list = []
	for slope_multiplier in [-1,1]:
		 for reciprocator in [a,1]:
			for intercept_multiplier in [-1,1]:
				distractor = ( y == slope_multiplier * equation.slope()^(a) * x + intercept_multiplier * equation.y_intercept())
				distractor_list.append(distractor)
				distractor = ( y == slope_multiplier * equation.y_intercept()^(a) * x + intercept_multiplier * equation.slope())
				distractor_list.append(distractor)
	return [answer, distractor_list]
		
def format_solution(answer,distractor_list,equation):
	question_string = equation.graph_points()
	answer_list_strings = [latex(answer),latex(distractor) for distractor in distractor_list]
	return [question_string,answer_list_strings]