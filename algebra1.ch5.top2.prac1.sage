'''
given a slope and a point, find equation of line in slope-intercept form

author: rmorey
'''

attach yaml_format.sage
import random
import time

QUESTIONSET_FILENAME = "algebra1.ch5.top2.prac1.txt"
INSTRUCTION_STRING = "Find the slope-intercept equation of a line that passes through the given point, and has a slope of \(m\)."
PROPORTION = 1.0
NUMBER_OF_DISTRACTORS = 3
EQUATION_SET = create_set_of_linear_equations(2)

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
			for flip_point in [equation.point_1, (equation.point_1[1],equation.point_1[0])]:
				distractor = (y == slope_multiplier*equation.slope()*x + intercept_multiplier*(flip_point[0] - equation.slope()*flip_point[1]))
				distractor_list.append(distractor)
	return [answer, distractor_list]
		
def format_solution(answer_list,equation):
	question_string =  "\(" + str(equation.point_1) + " \\ m = " + latex(equation.slope()) + "\)"
	answer_list_strings = ["\(" + latex(answer) + "\)" for answer in answer_list]
	return [question_string,answer_list_strings]