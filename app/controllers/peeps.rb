class ChitterChallenge < Sinatra::Base
  get '/peeps' do
  	@peeps = Peep.all
  	erb:'peeps/index'
  end

  post '/peeps' do
  	Peep.create(peep: params[:peep])
  	redirect '/peeps'
  end

  get '/peeps/new' do
  	erb:'peeps/new'
  end
end
