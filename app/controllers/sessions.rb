class Chitter < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :index
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "See you next time!"
    redirect '/peeps'
  end
  
end