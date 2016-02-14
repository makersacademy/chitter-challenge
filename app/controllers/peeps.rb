class Chitter < Sinatra::Base
  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  post '/peep/new' do
    peep = Peep.create(body: params[:peep])
    peep.save
    redirect '/home'
  end
end
