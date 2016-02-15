
class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.keep[:errors] = ['The email or password is incorrect']
      redirect to '/'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "You've signed out successfully. See you soon!"
    redirect to '/'
  end

end
