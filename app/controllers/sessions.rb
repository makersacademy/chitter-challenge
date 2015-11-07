class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions/new' do
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email: email, password: password)
    if user
      session[:user_id] = user.id
      redirect to '/peeps/index'
    else
      flash.next[:notice] = ["Invalid email or password"]
      redirect to '/sessions/new'
    end
  end
end

