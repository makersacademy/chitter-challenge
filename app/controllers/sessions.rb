class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password]) || User.new
    @email = params[:email]
    if @user.id
      session[:user_id] = @user.id
      redirect '/peeps/view-all'
    else
      flash.now[:warning] = "Sign in failed"
      erb :'/sessions/new'
    end
  end

  get '/sessions/end' do
    flash.next[:goodbye] = "See you soon, #{current_user.name}. You have successfully logged out"
    session.clear
    @current_user = nil
    redirect '/'
  end

end
