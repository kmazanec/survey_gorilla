
# ====== GET ROUTES ========================


get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_survey' do

  erb :create_survey
end


get '/profile' do

  erb :profile
end

get '/login' do

  erb :login
end

get '/survey/:survey_id' do

  erb :take_survey
end


get '/survey/:survey_id/results' do

  erb :survey_results
end


# ====== POST ROUTES ========================


post '/login' do


end

post '/survey/:survey_id' do


end

post '/signup' do


end


