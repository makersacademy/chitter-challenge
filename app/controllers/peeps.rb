class Chitter < Sinatra::Base

  get '/' do
    redirect 'peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.sort {|peep1, peep2| peep2.created_at <=> peep1.created_at}
    erb :'peeps/peeps'
  end

  #posting a new peep
  post '/peeps' do
    peep = Peep.new(content: params[:content])
    current_user.peeps << peep
    peep.save
    redirect '/peeps'
  end

  post '/peeps/:peep_id' do
    peep = Peep.new(content: params[:reply])
    original = Peep.first(id: params[:peep_id])
    original.replies << peep
    current_user.peeps << peep
    peep.save
    redirect '/peeps'
  end

end