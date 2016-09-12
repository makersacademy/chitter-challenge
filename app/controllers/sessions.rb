class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/cheeps/new')
    else
      flash.now[:errors] = ['Your password and user name did not match']
      erb :'sessions/new'
    end
  end

  post '/sessions/sign_out' do
    flash[:notice] = "Auf Wiedersehen, goodbye #{current_user.user_name}"
    session[:user_id] = nil
    redirect to('/')
  end


end
