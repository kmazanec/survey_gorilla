enable :sessions

# ====== GET ROUTES ========================


get '/' do
  if session[:user_id]
    @surveys = Survey.all


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



    erb :profile
  else
    redirect to "/login"
  end
end



get '/survey/:survey_id' do
  if session[:user_id]



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



  redirect to '/profile'
end
