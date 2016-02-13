class Chitter < Sinatra::Base

  get '/users/signup' do
    logged_in?
    erb :'/users/signup'
  end

  post '/users/signup' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.valid?
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/users/signup'
    end
  end

end
