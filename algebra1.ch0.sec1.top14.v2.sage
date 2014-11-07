'''
This is division with variables
j*x/k*x = l
j*x/k = l*x
j/k*x = l/x
'''

attach yaml_format.sage
import random

myFile = open('algebra1.ch0.sec1.top14.txt','w')
create_html_html_multiple_question_set(myFile)
myFile.close()
myFile = open('algebra1.ch0.sec1.top14.txt','a')


def calculate_quotient_of_terms(quotient_coefficient,dividend_variable,divisor_coefficient,divisor_variable):
	dividend_coefficient = quotient_coefficient * divisor_coefficient
	dividend = dividend_coefficient*dividend_variable
	divisor = divisor_coefficient*divisor_variable
	quotient = dividend/divisor
	distractors = [quotient*x, (quotient_coefficient+1)*(quotient/quotient_coefficient), quotient_coefficient, (quotient_coefficient-1)*(quotient/quotient_coefficient), dividend*divisor, dividend]
	if dividend_variable == 1 and divisor_variable == 1: return [false,0,0,0]
	else: return [quotient, distractors, dividend, divisor]

r = range(-10,11)
r.remove(0)
		
def wrapper():
	for quotient_coefficient in r:
		for divisor_coefficient in r:
			dividend_variable = random.choice([x,1])
			divisor_variable = random.choice([x,1])
			[answer,distractors,dividend,divisor]= calculate_quotient_of_terms(quotient_coefficient,dividend_variable,divisor_coefficient,divisor_variable)
			if answer:
				answer_list= make_answer_list(answer,distractors,3)
				if answer_list and random.choice([0,1]):
					[question_string,answer_list_strings]=format_quotient_of_terms(dividend,divisor,answer_list)
					insert_html_html_multiple_question("Calculate the quotient",question_string,answer_list_strings,myFile)
	myFile.close()

def format_quotient_of_terms(dividend,divisor,answer_list):
	answer_list_strings = ['\('+latex(element)+ '\)'  for element in answer_list]
	style = random.randint(1,5)
	if style == 1:
		question_string = '\[' + latex(dividend)+'/'+latex(divisor)+'\]'
	elif style == 2:
		question_string = '\[' + latex(dividend)+' \div ' + latex(divisor) + '\]'
	elif style == 3:
		question_string = '\[' + latex(dividend)+' \over ' + latex(divisor) + '\]'
	elif style == 4:
		question_string = '\[' + latex(dividend) + ' \cdot \\frac{1}{' +latex(divisor) + '} \]'
	elif style == 5: 
		question_string = '\[' + '\\frac{1}{' + latex(divisor) + '} \cdot ' + latex(dividend) + '\]'
	return [question_string, answer_list_strings]


