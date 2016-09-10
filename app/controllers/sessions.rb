class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:errors] = ["Email or password is not correct"]
      redirect '/sessions/new'
    end
  end

  delete '/sessions/log_out' do
    session[:user_id] = nil
    flash[:notice] = "Goodbye!"
    redirect '/peeps'
  end

end
