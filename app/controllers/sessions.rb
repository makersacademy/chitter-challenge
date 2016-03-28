class Chitter < Sinatra::Base

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/home'
    else
      flash.next[:notice] = 'The username or password is incorrect.'
      redirect to '/'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/logout'
  end

end
