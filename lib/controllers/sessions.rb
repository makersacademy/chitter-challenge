class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Email and/or password are/is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:sign_out] = 'See you later!'
    redirect '/peeps'
  end
end
