class Chitter < Sinatra::Base

  get '/users/new' do
    @current_email = session[:user_email]
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(email: params[:email], name: params[:name],
                     username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.save
      redirect '/'
    else
      session[:user_email] = user.email
      flash[:notice] = user.errors.full_messages.join(", ")
      redirect '/users/new'
    end
  end

end
