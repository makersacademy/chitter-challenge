class Chitter < Sinatra::Base

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by_email(params[:email])
    if @user&.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/login'
    end
  end

  get '/sessions/logout' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

end
