class ChitterCore < Sinatra::Base

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:message] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions/new' do
    flash[:message] = ["Goodbye #{current_user.name}."]
    session[:user_id] = nil
    redirect to '/'
  end

end
