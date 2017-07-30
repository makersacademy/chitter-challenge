class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            username: params[:username],
            name: params[:name])
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:error_message] = @user.errors.full_messages.last
      erb :'users/new'
    end
  end
end
