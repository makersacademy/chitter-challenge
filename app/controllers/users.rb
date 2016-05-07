class Chitter < Sinatra::Base

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    user = User.create(name: params[:name],
                       user_name: params[:user_name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'user/new'
    end
  end

end
