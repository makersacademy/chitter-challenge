class Chitter < Sinatra::Base 

  get '/sessions/new' do 
    erb :'sessions/new'
  end

  post '/sessions' do 
    user = User.authenticate(
      params[:email], 
      params[:password]
    )
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.keep[:errors] = ['The email or password is incorrect']
      session[:email] = params[:email]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

end