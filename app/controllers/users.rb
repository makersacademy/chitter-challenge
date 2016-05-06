class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
    username: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users/new' #CHANGE THIS ROUTE TO STARTPAGE
    else
      flash.keep[:errors] = @user.errors.full_messages
      redirect '/users/new'
    end
  end

end
