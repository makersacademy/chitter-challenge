class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(email: params[:Email],
                  name: params[:Name],
                  username: params[:Username],
                  password: params[:Password],
                  password_confirmation: params[:Password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/tweets/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
