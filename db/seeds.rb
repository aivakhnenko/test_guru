# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { user_type: 0, name: 'John' }, 
  { user_type: 0, name: 'Mike' },
  { user_type: 1, name: 'Admin' }, 
  { user_type: 1, name: 'Teacher' }, 
])

categories = Category.create!([
  { title: 'Frontend' }, 
  { title: 'Backend' }, 
  { title: 'Mobile Development' }
])

tests = Test.create!([
  { category_id: categories[0].id, level: 0, user_id: users[2].id, title: 'HTML' }, 
  { category_id: categories[0].id, level: 1, user_id: users[2].id, title: 'CSS' }, 
  { category_id: categories[0].id, level: 2, user_id: users[2].id, title: 'JS' }, 
  { category_id: categories[1].id, level: 3, user_id: users[3].id, title: 'Ruby' }, 
  { category_id: categories[2].id, level: 3, user_id: users[3].id, title: 'Objective_C' }
])

questions = Question.create!([
  { test_id: tests[0].id, body: 'Name tag for hyperlink.' }, 
  { test_id: tests[1].id, body: 'How can you make text underlined?' }, 
  { test_id: tests[2].id, body: 'What keyword should you use to declare a variable?' }, 
  { test_id: tests[3].id, body: 'What is the symbol for hash rocker?' }, 
  { test_id: tests[4].id, body: 'What keyword should you use before code block, if you want to catch an exception in this code block?' }
])

answers = Answer.create!([
  { question_id: questions[0].id, correct: true, text: 'a' }, 
  { question_id: questions[0].id, correct: false, text: 'p' }, 
  { question_id: questions[1].id, correct: true, text: 'text-decoration: underline;' }, 
  { question_id: questions[1].id, correct: false, text: 'text-decoration: line-through;' }, 
  { question_id: questions[2].id, correct: true, text: 'var' }, 
  { question_id: questions[2].id, correct: false, text: 'int' }, 
  { question_id: questions[3].id, correct: true, text: '=>' }, 
  { question_id: questions[3].id, correct: false, text: '<=' }, 
  { question_id: questions[4].id, correct: true, text: '@try' }, 
  { question_id: questions[4].id, correct: false, text: '@catch' }
])

tests_users = TestsUser.create!([
  { user_id: users[0].id, test_id: tests[0].id, status: 1},
  { user_id: users[0].id, test_id: tests[1].id, status: 1},
  { user_id: users[0].id, test_id: tests[2].id, status: 1},
  { user_id: users[0].id, test_id: tests[3].id, status: 0},
  { user_id: users[1].id, test_id: tests[4].id, status: 0},
])
