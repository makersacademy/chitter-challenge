class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username],
                              params[:password])
    if user
      session[:user_id] = user.id
      flash.now[:notice] = 'Successfully logged in'
      redirect to '/peeps/index'
    else
      flash.now[:errors] =  ["Username or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have successfully signed out'
    redirect to '/sessions/new'
  end

end
