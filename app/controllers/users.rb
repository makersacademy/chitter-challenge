class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/messages')
    else
      flash.now[:errors] = @user.errors
      erb :'users/new'
    end
  end

end
