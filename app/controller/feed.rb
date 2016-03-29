class Chitter <Sinatra::Base

  get '/feed' do
    @feed = Feed.all
    erb(:'feed/index')
  end

  get '/feed/new' do
    erb (:'feed/new')
  end

  post '/feed/new' do
   
   user=  User.get(session[:user_id])
        
    if user
      
      peep=(params[:peep])
      
      if peep
        feed = user.feed.new(peep: peep)
        feed.save
        redirect(:'/feed')
      else
        flash.now[:errors] = ["Please enter peep"]
        erb (:'feed/new')
      end
    
    else
      flash.now[:errors] = ["Please sign in to peep"]
      erb (:'feed/new')
    end
  end


end
