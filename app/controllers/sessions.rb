class Chitter < Sinatra::Base
  get '/sessions/new' do
    if !current_user
      erb :'sessions/new'
    else
      flash.keep[:notice] = 'You are already signed in.'
      redirect to '/posts'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have signed out. Goodbye!'
    redirect to '/posts'
  end
end
