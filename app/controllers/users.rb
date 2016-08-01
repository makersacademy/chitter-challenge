class Chitter < Sinatra::Base
  get '/users/new' do
    if !current_user
      erb :'users/new'
    else
      flash.keep[:notice] = 'You are logged in.'
      redirect to '/posts'
    end
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
