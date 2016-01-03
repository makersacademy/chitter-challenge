class Chitter < Sinatra::Base
  get '/sessions/new' do
    redirect '/' if current_user
    erb :'sessions/new'
  end

  post '/sessions' do
    user_id = User.authenticate(params[:user_or_email], params[:password])
    if user_id
      session[:user_id] = user_id
      redirect '/'
    else
      flash.now[:errors] = ['User / Email or password are not correct']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.next[:notice] = "#{current_user.name}, you logged out successfully"
    session[:user_id] = nil
    redirect '/'
  end
end
