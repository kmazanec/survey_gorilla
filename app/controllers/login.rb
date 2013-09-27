
# ======= GET =====================

get '/login' do
  if session[:user_id]
    redirect to "/"
  else
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect to '/login'
end


# =========== POST ===============

post '/login' do

  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect to "/"
  else
    redirect to "/login"
  end
end

post '/signup' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.password_confirmation = params[:password_confirmation]

  if user.save
    session[:user_id] = user.id
    redirect to '/'
  else
    redirect to "/login"
  end
end

