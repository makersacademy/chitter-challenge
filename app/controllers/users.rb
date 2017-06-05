class Chitter < Sinatra::Base

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.create(name:                   params[:name],
  username:               params[:username],
  email:                  params[:email],
  password:               params[:password],
  password_confirmation:  params[:password_confirmation])
  if user.save
    session[:user_id] = user.id
    redirect to '/peeps'
  else
    flash.now[:notice] = 'Passwords must match. Please try again.'
    erb ':users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  user = User.first(username: params[:username])

  if user
    session[:user_id] = user.id
    redirect to '/peeps'
  else
    flash.next[:notice2] = 'We do not have that username. Please signup first so we can log you in.'
    redirect to '/users/new'
  end
end

get '/users/logout' do
  erb :'users/logout'
end

post '/users/logout' do
  params[:logout]
  session.clear
  redirect to '/users/login'
  erb :'users/logout'
end

end 
