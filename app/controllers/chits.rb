class Chitter < Sinatra::Base

  get '/chits' do
    @name = session[:me]
    @chits = Chit.all
    erb(:'chits/index')
  end

  get '/chits/add' do
    erb(:'chits/new')
  end

  post '/chits/new' do
    link = Chit.create(title: params[:title], href: params[:href])
    redirect to('/chits')
  end
end
