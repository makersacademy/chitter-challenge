class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], firstname: params[:firstname], surname: params[:surname], email: params[:email])

    if user.save
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end
end
