class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user_details = {
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    }
    @user = User.new(user_details)
    if @user.save
      session[:user_id] = @user.id
      erb :home
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
