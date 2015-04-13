class Chitter < Sinatra::Base

  get '/chit/new' do
    erb :'chit/new'
  end

  delete '/chit' do
    @user = session[:user_id]
    session[:user_id] = nil
    flash[:notice] = "#{User.first(id: @user).handle} is now logged out"
    redirect '/'
  end

  post '/chit' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.name}, your account #{user.handle} is ready to send a Peep!"
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect, no peeps for you!']
      erb :'chit/new'
    end
  end

end