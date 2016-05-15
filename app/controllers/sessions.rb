class Chitter < Sinatra::Base
  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'See you soon!'
    redirect '/'
  end
end