# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { type: 'User', last_name: 'Smith', first_name: 'John', email: 'john@example.com', password: 'iamaguru' }, 
  { type: 'User', last_name: 'Green', first_name: 'Mike', email: 'mike@example.com', password: 'iamaguru' }, 
  { type: 'Admin', last_name: 'Admin', first_name: 'Admin', email: 'admin@example.com', password: 'iamaguru' }, 
  { type: 'Admin', last_name: 'Teacher', first_name: 'Teacher', email: 'teacher@example.com', password: 'iamaguru' }
])

categories = Category.create!([
  { title: 'Frontend' }, 
  { title: 'Backend' }, 
  { title: 'Mobile Development' }
])

tests = Test.create!([
  { category: categories[0], level: 1, author: users[2], title: 'HTML' }, 
  { category: categories[0], level: 2, author: users[2], title: 'CSS' }, 
  { category: categories[0], level: 3, author: users[2], title: 'JS' }, 
  { category: categories[1], level: 4, author: users[3], title: 'Ruby' }, 
  { category: categories[2], level: 4, author: users[3], title: 'Objective_C' }
])

questions = Question.create!([
  { test: tests[0], body: 'Name tag for hyperlink.' }, 
  { test: tests[1], body: 'How can you make text underlined?' }, 
  { test: tests[2], body: 'What keyword should you use to declare a variable?' }, 
  { test: tests[3], body: 'What is the symbol for hash rocker?' }, 
  { test: tests[4], body: 'What keyword should you use before code block, if you want to catch an exception in this code block?' }, 
  { test: tests[3], body: 'Who created the Ruby language?' }, 
  { test: tests[3], body: 'What is the default value of the instance variable?' }  
])

answers = Answer.create!([
  { question: questions[0], correct: true, text: 'a' }, 
  { question: questions[0], correct: false, text: 'p' }, 
  { question: questions[1], correct: true, text: 'text-decoration: underline;' }, 
  { question: questions[1], correct: false, text: 'text-decoration: line-through;' }, 
  { question: questions[2], correct: true, text: 'var' }, 
  { question: questions[2], correct: false, text: 'int' }, 
  { question: questions[3], correct: true, text: '=>' }, 
  { question: questions[3], correct: false, text: '<=' }, 
  { question: questions[4], correct: true, text: '@try' }, 
  { question: questions[4], correct: false, text: '@catch' }, 
  { question: questions[5], correct: true, text: 'Matz' }, 
  { question: questions[5], correct: false, text: 'John Doe' }, 
  { question: questions[5], correct: false, text: 'Linus Torvalds' }, 
  { question: questions[5], correct: false, text: 'Donald Duck' }, 
  { question: questions[6], correct: true, text: 'nil' }, 
  { question: questions[6], correct: false, text: 'false' }
])

test_attempts = TestAttempt.create!([
  { user: users[0], test: tests[0] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[2] },
  { user: users[0], test: tests[3] },
  { user: users[1], test: tests[4] },
])
