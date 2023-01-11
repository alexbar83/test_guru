 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ first_name: 'Alex', last_name: 'Petrov', email: '' },
                     { first_name: 'Dmitry', last_name: 'Ivanov', email: '' },
                     { first_name: 'Pavel', last_name: 'Zudov', email: '' }])

categories = Category.create([{ title: 'Geografy' },
                              { title: 'History' },
                              { title: 'Matematika' }])

tests = Test.create([{ title: 'Test 1', level: 2, category_id: categories.first, author: users.first },
                     { title: 'Test 2', level: 3, category_id: categories.last, author: users[2] },
                     { title: 'Test 3', level: 2, category_id: categories[1], author: users.first },
                     { title: 'Test 4', level: 3, category_id: categories.last, author: users[1] },
                     { title: 'Test 5', level: 1, category_id: categories.first, author: users[2] }])

questions = Question.create([{ body: 'Назовите самый маленький континент', test_id: tests.first },
                             { body: 'Какой формы земля?', test_id: tests[1] },
                             { body: 'Маск, Перельман, Обама - кто из них является нобелевским лауреатом?',
                              test_id: tests[2] },
                             { body: 'В каком году было Крещение Руси?', test_id: tests[3] },
                             { body: 'Какая формула теоремы Пифагора?', test_id: tests.last }])

answers = Answer.create([{ body: 'Австралия', correct: true, question_id: questions.first },
                         { body: 'Африка', question_id: questions.first },
                         { body: 'Антарктида', question_id: questions.first },

                         { body: 'Геойд', correct: true, question_id: questions[1] },
                         { body: 'Шарообразная', correct: true, question_id: questions[1] },
                         { body: 'Плоская', question_id: questions[1] },

                         { body: 'Обама', correct: true, question_id: questions[2] },
                         { body: 'Перельман', question_id: questions[2] },
                         { body: 'Маск', question_id: questions[2] },

                         { body: '988', correct: true, question_id: questions[3] },
                         { body: '1088', question_id: questions[3] },
                         { body: '986', question_id: questions[3] },

                         { body: '2 + 2 = 4', question_id: questions[4] },
                         { body: 'a**2 + b**2 = c**2', correct: true, question_id: questions[4] },
                         { body: 'E = mc**2', question_id: questions[4] }])


