class Tweeter < Sinatra::Base
    get '/session/new' do
      erb :'session/new'
    end

    post '/session' do
      user = User.authenticate(params[:email], params[:password])
      if user.nil?
        flash.now[:errors] = ['incorrect username or password']
        erb :'/session/new'
      else
        session[:user_id] = user.id
        redirect '/'
      end
    end

    delete '/session' do
      session[:user_id] = nil
      redirect to '/'
    end
  end
