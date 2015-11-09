class ChitterApp < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:errors] = ['Login details incorrect']
    end
    redirect '/peeps'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:message] = 'Logged out succesfully'
    redirect '/peeps'
  end

end
