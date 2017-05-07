class Chitter < Sinatra::Base
  get '/peeps/all' do
    @peeps = Peep.all
    erb :'/peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/submitted' do
    Peep.create(peep: params[:peep])
    redirect to('/peeps/all')
  end

end
