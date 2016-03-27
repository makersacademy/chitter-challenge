class Chitter <Sinatra::Base

  get '/feed' do
    @feed = Feed.all
    erb(:'feed/index')
  end

  get '/feed/new' do
    erb (:'feed/new')
  end

  post '/feed/new' do
   
    feed = Feed.new(peep: params[:peep])


      
    if User.get(session[:user_id])
      feed.save  
      redirect(:'/feed')
    else
      flash.now[:errors] = ["Please sign in to peep"]
      erb (:'feed/new')
    end
  end


end
