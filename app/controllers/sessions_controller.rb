class SessionsController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/sessions/new' do
    erb(:"sessions/new")
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user.nil?
      flash[:notice] = 'Please check email or password.' 
      redirect '/sessions/new'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end
end
