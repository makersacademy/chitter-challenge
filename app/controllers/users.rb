class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/new'
    end
  end

end
