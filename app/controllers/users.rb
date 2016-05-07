class Chitter < Sinatra::Base

  before do
    @user ||= User.new
  end

  get '/users/new' do
    #@user = User.new
    erb :'/users/new'
  end

  get '/users/login' do
    @email = session[:email]
    erb :'/users/login'
  end

  post '/users' do
    @user = User.create(name: params[:name],
    username: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.keep[:errors] = @user.errors.full_messages
      redirect '/users/new'
    end
  end

end
