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
    erb :create_survey
  else
    redirect to "/login"
  end
end


get '/profile' do
  if session[:user_id]
    @surveys = User.find(session[:user_id]).created_surveys
    @take_surveys = User.find(session[:user_id]).taken_surveys
    erb :profile
  else
    redirect to "/login"
  end
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



    erb :survey_results
  else
    redirect to "/login"
  end
end


# ====== POST ROUTES ========================




post '/survey/:survey_id' do
  

  

  redirect to "/survey/#{params[:survey_id]}/results"
end




post '/create_survey' do
  puts "======================================"
  puts params.inspect
  puts "======================================"
  puts

  new_survey = Survey.new(name: params[:name], creator_id: session[:user_id])
  new_question = Question.new(text: params[:question])
  
  params[:options].each_value do |option_text|
    new_question.options << Option.create(text: option_text)
  end

  new_question.save
  new_survey.questions << new_question

  new_survey.save

  puts "======================================"
  puts "New Survey: #{new_survey.inspect}"
  puts "New Question: #{new_question.inspect}"
  puts "New question's options: #{new_question.options.inspect}"
  puts "======================================"



  redirect to '/profile'
end
