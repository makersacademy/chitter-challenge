class Chitter < Sinatra::Base

  get '/' do
    redirect 'peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [ :timestamp.desc])
    @user = current_user
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message],
                    timestamp: Time.now)
    current_user.peeps << peep
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :new   # por que no ' ' ???
    else
      redirect to '/sessions/new'
    end
  end

  get '/reply' do
    @username = params[:username]
    erb :'peeps/reply'
  end
end