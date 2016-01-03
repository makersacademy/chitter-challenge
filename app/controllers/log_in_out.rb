class App < Sinatra::Base
  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      flash.next[:message] = :welcome_back
      redirect '/peeps'
    else
      flash.next[:email] = params[:email]
      flash.next[:message] = :login_errors
      redirect '/login'
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.next[:message] = :goodbye
    redirect '/peeps'
  end
end
