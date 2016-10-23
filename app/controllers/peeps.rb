class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect to('/home')
  end

end
