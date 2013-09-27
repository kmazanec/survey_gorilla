
# ======= GET =====================

get '/login' do

  erb :login
end

get '/logout' do
  session.clear
  redirect to '/login'
end


# =========== POST ===============

post '/login' do

  redirect to '/'
end

post '/signup' do


  redirect to '/'
end

