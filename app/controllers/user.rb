class ChitterApp < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      user_name: params[:user_name],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

      session[:user_id] = user.id
    if user.save
      redirect '/'
    else
      flash[:error] = user.errors.full_messages
      redirect '/users/new'
    end
  end
end
