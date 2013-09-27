  User.create(username: "bob", email:"s@a.com",password: "veveve",password_confirmation: "veveve")
  User.create(username: "frank", email:"b@a.com",password: "veveve",password_confirmation: "veveve")
  User.create(username: "reggie", email:"d@a.com",password: "veveve",password_confirmation: "veveve")



  option1=Option.create(text:"black")
  option2=Option.create(text:"Green")

  s=Survey.create(name:"cats",creator_id:1)
  q=Question.new(text: "?", survey_id: s.id)
  q.options << option1
  q.options << option2
  q.save

  # Option.create(text:"black",question_id:1)
  # Option.create(text:"Green",question_id:1)
  # q.save
  # s.save

  

