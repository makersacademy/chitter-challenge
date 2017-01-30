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
    timenow = Time.now
    peep = Peep.new(message: params[:peep], time: timenow.strftime("%H:%M"))
    peep.save
    redirect '/timeline'
  end

end
