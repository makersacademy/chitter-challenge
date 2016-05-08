class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/posts/view'
    else
      flash.now[:errors] = ['Your Username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.keep[:goodbye] = "Till next time #{current_user.name}"
    session[:user_id] = nil
    redirect '/goodbye'
  end
end