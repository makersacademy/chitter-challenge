class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect'/'
    else
      flash[:alert] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:success] = 'You have signed out.'
    redirect'/'
  end
end
