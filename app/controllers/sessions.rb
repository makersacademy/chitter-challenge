class Chitter < Sinatra::Base

  post '/session' do
    if auth_user
      session[:user_id] = auth_user.id
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
