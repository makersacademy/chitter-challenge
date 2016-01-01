class Chitter < Sinatra::Base
  post '/sessions' do
    user = User.authenticate(params[:existing_username],
    params[:existing_password])
    if user
      session[:user_id] = user.id
      redirect to('/messages')
    else
      flash.now[:errors] = [['The username or password is incorrect']]
      erb :'users/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect to '/users/new'
  end
end
