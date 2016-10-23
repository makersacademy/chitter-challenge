class ChitterApp < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps/peepdeck'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end

  get '/sessions/sign_in' do
    erb :'sessions/sign_in'
  end

  delete '/sessions/sign_out' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Peep again soon'
    redirect to '/'
  end

end
