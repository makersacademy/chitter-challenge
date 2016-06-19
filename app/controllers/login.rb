class Chitter < Sinatra::Base
  get '/login' do
    erb :'login/index'
  end

  post '/login' do
    user = User.authenticate(username: params[:username],
                             password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ["Username or password incorrect."]
      erb :'login/index'
    end
  end
end
