class Chitter < Sinatra::Base
  get '/peep/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.first_or_create(content: params[:content], maker_id: current_maker.id)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
