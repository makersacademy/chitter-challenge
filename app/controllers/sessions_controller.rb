class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username],
      password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash[:notice] = 'Incorrect login details, please try again.'
      redirect '/sessions/new'
    end
  end

  delete '/sessions/:id' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/posts'
  end
end
