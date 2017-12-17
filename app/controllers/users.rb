class Chitter < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb(:'users/signup')
  end

  post '/user' do
    @user = User.create(email: params[:email],
                       name: params[:name],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/signup')
    end
  end
end
