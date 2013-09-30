enable :sessions

# ====== GET ROUTES ========================


get '/' do
  if session[:user_id]
    @surveys = Survey.all
    @user = User.find(session[:user_id])

    erb :index
  else
    redirect to "/login"
  end
end

get '/create_survey' do
  if session[:user_id]
    # erb :create_survey
    erb :add_survey
  else
    redirect to "/login"
  end
end


get '/profile' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @surveys = User.find(session[:user_id]).created_surveys
    @taken_surveys = User.find(session[:user_id]).taken_surveys
    
    erb :profile
  else
    redirect to "/login"
  end
end

get '/next_question/:id' do
  @survey =Survey.find(params[:id])
  
  erb :new_question

end 



get '/survey/:survey_id' do
  if session[:user_id]
    @survey = Survey.find(params[:survey_id])
    erb :take_survey
  else
    redirect to "/login"
  end
end


get '/survey/:survey_id/results' do
  if session[:user_id]
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions

    erb :survey_results
  else
    redirect to "/login"
  end
end

get '/charts/:id' do
  @question=Question.find(params[:id])
  # @options=@question.options

  # @options.each do |o|

  erb :chart
end  




# ====== POST ROUTES ========================




post '/survey/:survey_id' do
  puts "======================================"
  puts params.inspect
  puts "======================================"
  puts

  if TakenSurvey.find_by(taker_id: session[:user_id], survey_id: params[:survey_id])
    redirect to "/survey/#{params[:survey_id]}/results"
    puts "This user has already taken that survey!"
  end

  new_taken_survey = TakenSurvey.new(taker_id: session[:user_id], survey_id: params[:survey_id])


  Survey.find(params[:survey_id]).questions.each do |question|
    new_taken_survey.choices << Choice.create(option_id: Option.find(params[question.id.to_s.to_sym].to_i).id, question: question)
  end


  new_taken_survey.save

  redirect to "/survey/#{params[:survey_id]}/results"
end







post '/create_survey' do
  puts "========== Create survey ============================"

  puts params.inspect

  new_survey = Survey.new(name: params[:name], creator_id: session[:user_id])


  params[:questions].each do |q|
    puts "Question: #{q}"
    new_question = Question.new(text: q.last)
    params[:options][q.first].each do |option|
      new_question.options << Option.create(text: option.last)
    end
    new_question.save
    new_survey.questions << new_question
  end

  new_survey.save


  puts "======================================"

  # new_question = Question.new(text: params[:question])
  
  # params[:options].each_value do |option_text|
  #   new_question.options << Option.create(text: option_text)
  # end

  # new_question.save
  # new_survey.questions << new_question

  # new_survey.save
  # new_survey

  # redirect "/next_question/#{new_survey.id}"
  # puts "======================================"
  # puts "New Survey: #{new_survey.inspect}"
  # puts "New Question: #{new_question.inspect}"
  # puts "New question's options: #{new_question.options.inspect}"
  # puts "======================================"



  redirect to '/profile'
end

post '/create_question' do
   survey= Survey.find(params[:survey_id])
   new_question = Question.new(text: params[:question])

   params[:options].each_value do |option_text|
     new_question.options << Option.create(text: option_text)
   end

  new_question.save
  survey.questions << new_question

  p survey.questions

  redirect "/next_question/#{survey.id}"
  

end  

post '/fetch_results' do

  question =Question.find_by_text(params[:data])
   question

  @options=question.options
  hash={}
  @options.each_with_index do |o,i|
     hash[i] = o.choices.length
  end

content_type :json
 hash.to_json

end  


post '/fetch_names' do
  p  params[:data]

  question =Question.find_by_text(params[:data])
  @options=question.options
  hash={}
  @options.each_with_index do |o,i|
     hash[i] = o.text
  end
  

content_type :json
 hash.to_json

end









