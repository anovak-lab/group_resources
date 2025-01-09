import random

students = ['Aya', 'Mohamed', 'Mahmoud', 'Michael', 'Kevin', 'Maria']

r = random.randint(0, len(students) - 1)

print('Thanks, {}, for volunteering!'.format(students[r]))
