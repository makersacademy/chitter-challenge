class App < Sinatra::Base
  get '/login' do
    erb :'login'
  end

  post '/login' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      flash.keep[:message] = :welcome_back
      redirect '/peeps'
    else
      flash[:email] = params[:email]
      flash[:message] = :login_errors
      redirect '/login'
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash[:message] = :goodbye
    redirect '/peeps'
  end
end
