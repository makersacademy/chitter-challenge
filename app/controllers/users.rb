class Chitter < Sinatra::Base

  get '/users' do
    "Welcome"
  end
  
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], 
                        username: params[:username], 
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      erb :'users/new'
    end
  end

end
