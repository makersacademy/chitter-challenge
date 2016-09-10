class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                 email: params[:email],
                 username: params[:username],
                 password: params[:password],
                 password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:errors] = user.errors.full_messages
      flash[:name] = params[:name]
      flash[:email] = params[:email]
      flash[:username] = params[:username]
      redirect '/users/new'
    end
  end
end
