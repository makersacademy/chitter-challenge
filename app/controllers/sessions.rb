class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new_session'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/messages'
    else
      flash.now[:errors] = ["Password or email does not match"]
      p '-->'
      erb :'sessions/new_session'
    end

  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/messages'
  end

end
