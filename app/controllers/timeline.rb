class Chitter < Sinatra::Base

  get '/' do
    redirect '/timeline'
  end

  get '/timeline' do
    @username = session[:username]
    @peeps = Peep.all
    erb :timeline
  end

  get '/timeline/new' do
    erb :'timeline/new'
  end

  post '/timeline' do
    peep = Peep.new(message: params[:peep], time: Time.now)
    peep.save
    redirect '/timeline'
  end

end
