class Chitter < Sinatra::Base
  get '/users' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    username: params[:username],
    name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/users'
    end
  end
end
