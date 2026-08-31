import random

students = ['Mohamed', 'Mahmoud', 'Michael', 'Kevin', 'Maria', 'Jamar', 'Stetson', 'Efe', 'Gavin', 'Rahaf', 'Rainad']

r = random.randint(0, len(students) - 1)

print('Thanks, {}, for volunteering!'.format(students[r]))
