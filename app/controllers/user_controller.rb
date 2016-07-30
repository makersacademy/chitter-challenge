class Chitter < Sinatra::Base

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(full_name: params[:full_name],
               username: params[:username],
               email: params[:email],
               password: params[:password],
               password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end
