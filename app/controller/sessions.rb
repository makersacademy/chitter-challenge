class ChitterApp < Sinatra::Base

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user_name, password = params[:user_name], params[:password]
    user = User.authenticate(user_name, password)
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash[:errors] = ["The user name or password is incorrect"]
      erb :"sessions/new"
    end
  end


  delete '/sessions' do
    flash[:notice] = "You are signed out"
    session[:user_id] = nil
    redirect to('/')
  end


end