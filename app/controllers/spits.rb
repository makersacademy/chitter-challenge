class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/spits' do
    @spits = Spit.all
    erb :'spits/index'
  end

  get '/spits/new' do
    erb :'spits/new'
  end

  post '/spits' do
    spit = Spit.create(content: params[:content])
    spit.user = current_user
    if spit.save
      redirect to('/spits')
    else
      flash.keep[:errors] = ["Only users can take a Shit"]
      redirect to('/sessions/new')
    end
  end
end
