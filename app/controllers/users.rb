class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      :username => params[:username],
      :email => params[:email],
      :password => params[:password],
      :password_confirmation => params[:password_confirmation],
      :name => params[:name]
    )

    if user.save
      session[:user_id] = user.id
    else
      flash[:notice] = user.errors.full_messages
      p flash[:notice]
    end
    redirect '/'
  end

end
