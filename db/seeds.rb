require 'faker'

25.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "test", password_confirmation: "test")
end

100.times do
  Option.create(text: Faker::Commerce.product_name)
end

10.times do
  q = Question.new(text: Faker::Company.catch_phrase, survey_id: rand(1..5))
  4.times do
    q.options << Option.all.sample
  end
  q.save
end

questions = Question.all

5.times do
  s = Survey.new(name: Faker::Lorem.sentence(4), creator_id: rand(1..25))
  2.times do
    s.questions << questions.pop
  end
  s.save
end






  # User.create(username: "bob", email:"s@a.com",password: "veveve",password_confirmation: "veveve")
  # User.create(username: "frank", email:"b@a.com",password: "veveve",password_confirmation: "veveve")
  # User.create(username: "reggie", email:"d@a.com",password: "veveve",password_confirmation: "veveve")

  

  # option1=Option.create(text:"black")
  # option2=Option.create(text:"Green")


  # s=Survey.new(name:"cats",creator_id:1)
  # q=Question.new(text: "?", survey_id: s.id)
  # q.options << option1
  # q.options << option2
  # TakenSurvey.new
  # Choice.create(option_id: 1,)

  # q.save
  # TakenSurvey.create()
  # # Option.create(text:"black",question_id:1)
  # Option.create(text:"Green",question_id:1)
  # q.save
  # s.save

  

