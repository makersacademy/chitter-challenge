class Chitter < Sinatra::Base
  get '/signup' do
    erb :'signup/index'
  end

  post '/signup' do
    user = User.create(display_name: params[:display_name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/signup/index'
    end
  end
end
