'''
Permutation problems
'''
y = var('y')
attach yaml_format.sage
import random
import time

permFile = open('algebra1.x.perm.txt','w')
create_html_html_multiple_question_set(permFile)
permFile.close()
permFile = open('algebra1.x.perm.txt','a')
	
combFile = open('algebra1.x.comb.txt','w')
create_html_html_multiple_question_set(combFile)
combFile.close()
combFile = open('algebra1.x.comb.txt','a')
	
class Scenario:
	pass
	
basketball = Scenario()
basketball.nrange = range(10,31)
basketball.rrange = range(5,9)
basketball.perm_string = "If a basketball team has {n} players, and there are {r} unique positions, how many ways can you fill those positions?"
basketball.comb_string = "If a basketball team has {n} players, and you can only have {r} players on the court at a time, how many ways can those spots be filled?"

ipod = Scenario()
ipod.nrange = range(50,60)
ipod.rrange = range(15,20)
ipod.perm_string = "If your iPod has {n} songs, and you put it on shuffle, how many ways can you play {r} songs? Songs don't repeat."
ipod.comb_string = "If your iPod has {n} songs, how many ways can you {r} of those songs on a cd?"

scenarios = [basketball, ipod]

def wrapper():	
	question_count = 0
	time_start = time.time()
	for scenario in scenarios:
		for n in scenario.nrange:
			for r in scenario.rrange:
				for type in ["perm", "comb"]:
					if random.random() < 1:
						if type == "perm": 
							myFile = permFile
						if type == "comb": 
							myFile = combFile
						[answer,distractors] = comb_or_perm(scenario, n, r, type)			       
						answer_list= make_answer_list(answer,distractors,3)
						[question_string, answer_list_strings] = format_comb_or_perm(scenario,type,n,r,answer_list)
						insert_html_html_multiple_question(" ",question_string,answer_list_strings,myFile)
						question_count += 1
	permFile.close()
	combFile.close()
	time_end = time.time()
	print str(question_count) + " questions printed to file in " + str(int(time_end) - int(time_start)) + " seconds."
	
def comb_or_perm(scenario, n, r, type):
	if type=="perm":
		answer = Permutations(n,r).cardinality()
		wrong_thing = Combinations(n,r).cardinality()
	if type=="comb":
		answer = Combinations(n,r).cardinality()
		wrong_thing = Permutations(n,r).cardinality()
	distractors = []
	for wrong_n in [n-2,n+2]:
		for wrong_r in [r-2,r+2]:
			distractors.append(Permutations(wrong_n,wrong_r).cardinality())
			distractors.append(Combinations(wrong_n,wrong_r).cardinality())
	distractors.append(factorial(n))
	return [answer,distractors]               

def format_comb_or_perm(scenario,type,thisn,thisr,answer_list):
	if type == "perm": 
		myFile = permFile
		question_string = scenario.perm_string.format(n=thisn,r=thisr)
	if type == "comb": 
		myFile = combFile
		question_string = scenario.comb_string.format(n=thisn,r=thisr)		
	answer_list_strings=[]
	for answer in answer_list:
		answer_list_strings.append(str(answer))		
	return [question_string, answer_list_strings]	

			
