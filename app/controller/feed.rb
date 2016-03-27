class Chitter <Sinatra::Base

  get '/feed' do
    @feed = Feed.all
    erb(:'feed/index')
  end

  get '/feed/new' do
    erb (:'feed/new')
  end

  post '/feed/new' do
    feed = Feed.create(peep: params[:peep])
      
    if feed 
      redirect(:'/feed')
    else
      flash.now[:error] = feed.error.full_messages
    end
  end


end
