class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'/sessions/new')
    end
  end

  delete '/sessions' do
    flash.keep[:notice] = "Goodbye!"
    session[:user_id] = nil
    redirect '/peeps'
  end
end
