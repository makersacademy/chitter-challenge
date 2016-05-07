class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
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
      erb :new
    else
      redirect to '/sessions/new'
    end
  end
end