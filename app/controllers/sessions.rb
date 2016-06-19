class Chitter < Sinatra::Base

  get '/' do
    current_user
    @peeps = Peep.all(order: :id.desc)
    erb :'index'
  end

  post '/sign_in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = User.first(username: params[:username]).id
    else
      flash[:errors] = ["Invalid username or password"]
    end
    redirect('/')
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

end
