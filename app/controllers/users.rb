class Chitter < Sinatra::Base
  get '/sign-up' do
    @user = User.new
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.new(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save 
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end
end
