class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash.now[:notice] = ['incorrect username or password']
      erb :'sessions/new'
    else
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/sessions/end' do
    session[:user_id] = nil
    flash.now[:notice] = 'You have signed-out.'
    redirect '/'
  end

end
