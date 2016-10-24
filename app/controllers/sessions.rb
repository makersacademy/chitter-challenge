class Chitter < Sinatra::Base

  get '/sessions/log_in' do
    erb :'sessions/log_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/log_in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'See you around!'
    redirect('/')
  end
end
