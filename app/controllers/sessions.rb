class Chitter < Sinatra::Base
  get '/sessions/new' do
    if current_user
      redirect to '/peeps'
    else
      erb :'sessions/login'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      # add an error message
      erb :'sessions/login'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect to '/peeps'
  end
end
