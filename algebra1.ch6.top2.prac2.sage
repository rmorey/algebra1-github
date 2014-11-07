'''
This is one step inequalities subtraction

question formats
x - a > b
 - a + x > b
b < x - a
b < -a + x

x > b-a

author: rmorey
'''

attach yaml_format.sage
import random
import time

myFile = open('algebra1.ch6.top2.prac2.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch6.top2.prac2.txt','a')

#defines the function gt() to be greater than, lt() to be less than, etc
gt = (x > 5).operator()
lt = (x < 5).operator()
ge = (x >= 5).operator()
le = (x <= 5).operator()

def plot_x_inequality_addition(a,b,sign):
	answer = sign(x,b+a) #essentially x > b + a, or whatever the sign choice happens to be
	distractor_list = []
	for sign_choice in [sign, opposite(sign), wrong_circle(sign), opposite(wrong_circle(sign))]:
		for number_choice in [b-a, a-b, a+b, -a-b]:
			distractor_list.append(sign_choice(x,number_choice))
	for distractor in distractor_list[:]: # it takes an index of the entire list cause you can't modify a list you are iterating through
		if distractor.right() not in range(-10,11): # this takes out a distractor if it cant be plotted by number_line
			distractor_list.remove(distractor) 
	if answer.right() not in range(-10,11): # voids the question if the answer cant be plotted
		answer = False
	return [answer, distractor_list]
		
def format_plot_x_inequality_addition(a,b,sign,answer_list):
	if (random.random() < 0.5) and (a > 0):
		x_side = latex(-a) + " + x "
	else: 
		x_side = " x - \; " + latex(a)
	if random.random() < 0.5:
		question_string = "\[ " + x_side + latex_sign(sign) + latex(b) + "\]"
	else:
		question_string = "\[ " + latex(b) + opposite(latex_sign(sign)) + x_side + "\]"
	answer_list_strings = []
	for answer_choice in answer_list:
		try: # it checks to see if the needed svg already exists, and if it does, it uses it, otherwise...
			svg_file = open('graphics/' + str(answer_choice) + '.svg')
		except IOError: # ... it makes a new one
			numberLine = number_line() 
			numberLine.graph([str(answer_choice)])
			plt.savefig('graphics/' + str(answer_choice) + '.svg', format='svg')
			numberLine.clear()
			svg_file = open('graphics/' + str(answer_choice) + '.svg')
		svg_string = svg_file.read()
		svg_string = svg_string.replace('height="432pt" viewBox="0 0 576 432"', 'height="100pt" viewBox="40 108 530 216" preserveAspectRatio="xMinYMid slice"') #fixes the viewbox
		answer_list_strings.append("|\n      " + svg_string.replace('\n',''))
		svg_file.close()
	return [question_string,answer_list_strings]
	
a_range = IntegerRange(-10,11)
b_range = IntegerRange(-10,11)

proportion = 200.0/(len(a_range)*len(b_range)*4)
print str(len(a_range)*len(b_range)*4) + " possible questions"

def wrapper():
	question_count = 0
	time_start = time.time()
	for a in a_range:
		for b in b_range:
			for sign in [gt, lt, ge, le]: #wraps through the functions, greater than, less than, etc, not just strings representing them
				if (random.random() < proportion) and (a != 0):
					[answer,distractor_list] = plot_x_inequality_addition(a,b,sign)
					if answer != False:
						answer = str(answer)
						distractor_list = [str(thing) for thing in distractor_list[:]]
						answer_list = make_answer_list(answer,distractor_list,3)
						if answer_list:
							[question_string,answer_list_strings]=format_plot_x_inequality_addition(a,b,sign,answer_list)
							insert_html_html_multiple_question("Choose the number line which represents the inequality shown.",question_string,answer_list_strings,myFile)
							question_count += 1
	myFile.close()
	time_end = time.time()
	print str(question_count) + " questions printed to file in " + str(int(time_end) - int(time_start)) + " seconds."