class Chitter < Sinatra::Base

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.keep[:errors] = ['The email or password is incorrect']
      session[:email] = params[:email]
      redirect '/users/login'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Peep to you later!'
    redirect to '/'
  end
  
end
