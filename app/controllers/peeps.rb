class Chitter < Sinatra::Base
  enable :sessions
  enable :partial_underscores
  set :session_secret, 'super secret'

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/'
    end
  end

  post '/peeps' do
    peep = Peep.create(body: params[:body], time_stamp: Time.now)
    user = User.get(session[:user_id])
    peep.users << user
    peep.save
    redirect to('/')
  end

  post '/repeep/new' do
    if session[:user_id]
      session[:peep_id] = params[:peep_id].to_i
      load_peeps
      erb :index
    end
    redirect '/'
  end

  post '/repeep/message' do
    if session[:user_id]
      
    else
      redirect '/'
    end
  end
end
