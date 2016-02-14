class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  
  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                name: params[:name],
                username: params[:username], 
                password_confirmation: params[:password_confirmation])
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end