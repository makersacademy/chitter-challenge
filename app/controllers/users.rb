class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users/create' do
    @user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/welcome')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/welcome' do
    erb :welcome
  end
end
