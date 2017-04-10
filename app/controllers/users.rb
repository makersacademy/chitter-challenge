class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.new(first_name: params[:first_name],
                     last_name: params[:last_name],
                         email: params[:email],
                      username: params[:username],
                      password: params[:password],
         password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/signup'
    end
  end
end
