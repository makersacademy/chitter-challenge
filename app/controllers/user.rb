class Chitter < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(full_name: params[:full_name],user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/user/start'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/user/start' do
    erb :'user/start'
  end

end
