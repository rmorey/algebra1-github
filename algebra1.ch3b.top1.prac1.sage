'''
Representing ratios.
The question provides n1, n2, and asks for either n1/n2 or n2/n1. (Since the calculate is always n1/n2, the question must be phrased/coded so that it asks for n1/n2.)
Formatting in both frac{} and n:d format.

Question scenarios:
A soccer team plays some away and some home games
A basketball player makes some of his free-throw shots
Number of boys and girls in a class
Number of two different kinds of shoes




'''

attach yaml_format.sage
import random

myFile = open('algebra1.ch3b.top1.prac1.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch3b.top1.prac1.txt','a')

def calculate_ratio_basic(n1,n2):
	ratio = n1/n2
	total = n1+n2
	distractors = [n2/n1,n1/total,n2/total,total/n1,total/n2]
	return [ratio, distractors]
	
def format_ratio_basic(n1,n2,answer_list):
	answer_list_strings = ["\[" +  latex(element) +  "\]" for element in answer_list]
	scenario = random.randint(1,4)
	question = random.randint(1,4)
	if 
	
	
'''
	if scenario == 1:
	   question = random.randint(1,4)
	   if question == 1:
	      question_string = "A soccer team plays {n1} home games and {n2} away games. Find the ratio of home games to away games.".format(n1=n1,n2=n2)
	   if question == 2:
	      question_string = "A soccer team plays {n2} home games and {n1} away games. Find the ratio of away games to home games.".format(n1=n1,n2=n2)
	   if question == 3:
	      question_string = "A soccer team plays {n2} away games and {n1} home games. Find the ratio of home games to away games.".format(n1=n1,n2=n2)
	   if question == 4:
	      question_string = "A soccer team plays {n1} away games and {n2} home games. Find the ratio of away games to home games.".format(n1=n1,n2=n2)
	if scenario == 2:
	   question = random.randint(1,4)
	   if question == 1:
	      question_string = "A basketball player makes {n1} of his free-throw shots and misses {n2}. Find the ratio of shots he makes to shots he misses.".format(n1=n1,n2=n2)
	   if question == 2:
	      question_string = "A basketball player makes {n2} of his free-throw shots and misses {n1}. Find the ratio of shots he misses to shots he makes.".format(n1=n1,n2=n2)
	   if question == 3:
	      question_string = "A basketball player misses {n1} of his free-throw shots and makes {n2}. Find the ratio of shots he misses to shots he makes.".format(n1=n1,n2=n2)
	   if question == 4:
	      question_string = "A basketball player misses {n2} of his free-throw shots and makes {n1}. Find the ratio of shots he makes to shots he misses.".format(n1=n1,n2=n2)
	if scenario == 3:
	   question = random.randint(1,4)
	   if question == 1:
	      question_string = "There are {n1} boys in a class and {n2} girls. Find the ratio of boys to girls in the class.".format(n1=n1,n2=n2)
	   if question == 2:
	      question_string = "There are {n2} boys in a class and {n1} girls. Find the ratio of girls to boys in the class.".format(n1=n1,n2=n2)
	   if question == 3:
	      question_string = "There are {n1} girls in a class and {n2} boys. Find the ratio of girls to boys in the class.".format(n1=n1,n2=n2)
	   if question == 4:
	      question_string = "There are {n2} girls in a class and {n1} boys. Find the ratio of boys to girls in the class.".format(n1=n1,n2=n2)
	if scenario == 4:
	   question = random.randint(1,4)
	   if question == 1:
	      question_string = "Molly has {n1} pairs of sneakers and {n2} pairs of sandals. Find the ratio of sneakers to sandals.".format(n1=n1,n2=n2)
	   if question == 2:
	      question_string = "Molly has {n2} pairs of sneakers and {n1} pairs of sandals. Find the ratio of sandals to sneakers.".format(n1=n1,n2=n2)
	   if question == 3:
	      question_string = "Molly has {n1} pairs of sandals and {n2} pairs of sneakers. Find the ratio of sandals to sneakers.".format(n1=n1,n2=n2)
	   if question == 4:
	      question_string = "Molly has {n2} pairs of sandals and {n1} pairs of sneakers. Find the ratio of sneakers to sandals.".format(n1=n1,n2=n2)
'''
	return [question_string,answer_list_strings]
	
n1_range = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] #range(1,21)
n2_range = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20] #range(1,21)

proportion = 200.0/(len(n1_range)*len(n2_range))
print str(len(n1_range)*len(n2_range)) + " possible questions"

def wrapper():
	question_count = 0
	for n1 in n1_range:
		for n2 in n2_range:
			if random.random() < proportion:
				[answer,distractors]= calculate_ratio_basic(n1,n2)
				answer_list= make_answer_list(answer,distractors,3)
				if answer_list:
					[question_string,answer_list_strings]=format_ratio_basic(n1,n2,answer_list)
					insert_html_html_multiple_question("' '",question_string,answer_list_strings,myFile)
					question_count += 1
	myFile.close()
	print str(question_count) + " questions printed to file"