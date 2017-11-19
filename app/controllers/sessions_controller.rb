class Chitter < Sinatra::Base

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/tweets/new')
    else
      flash[:errors] = "Incorrect username or password"
      erb :'sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/sessions/sign_out' do
    session[:user_id] = nil
    flash.now[:sign_out] = 'Thanks for visting!'
    redirect '/sessions/new'
  end
end
