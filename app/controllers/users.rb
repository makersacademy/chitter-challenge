require './app/models/user.rb'

class Chitter < Sinatra::Base
  get '/users/signup' do
    @details = flash[:details].nil? ? {} : flash[:details]
    erb :'users/signup'
  end

  post '/users/signup' do
    user = User.create(get_options)
    if user.id
      session[:user_id] = user.id
      flash[:message]  = "Welcome, #{current_user.name}"
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      flash[:details] = {email: params[:email], name: params[:name], username: params[:username]}
      redirect '/users/signup'
    end
  end

  get '/users/signout' do
    flash[:message] = "Goodbye, #{current_user.name}"
    session[:user_id] = nil
    redirect '/'
  end

  helpers do
    def get_options
      {name: params[:name],
       username: params[:username],
       email: params[:email],
       password: params[:password],
       password_confirmation: params[:password_confirmation]}
    end
  end
end
