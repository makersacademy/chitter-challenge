class UsersController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], username: params[:username], name: params[:name])
    if user == 1
      flash[:notice] = 'Email already exists.'
      redirect '/users/new'
    elsif user == 2
      flash[:notice] = 'Username already exists.'
      redirect '/users/new'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end
end
