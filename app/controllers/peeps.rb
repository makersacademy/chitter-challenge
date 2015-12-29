class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/add_peep' do
    erb :'peeps/add_peep'
  end

  post '/add_peep' do
    peep = Peep.create(peep: params[:peep])
    peep.save
    redirect '/peeps'
  end
end
