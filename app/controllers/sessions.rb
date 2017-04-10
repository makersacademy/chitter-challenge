class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new_session'
  end

  post '/sessions'
    User.authenticate(params[:email], params[:password])
    redirect '/peeps'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:error] = 'Goodbye!'
    redirect to '/users/new'
  end
  
end
