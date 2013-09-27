enable :sessions

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



get '/survey/:survey_id' do

  erb :take_survey
end


get '/survey/:survey_id/results' do

  erb :survey_results
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
