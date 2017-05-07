class Chitter < Sinatra::Base
  get '/peeps/all' do
    @peeps = Peep.all
    erb :'/peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/submitted' do
    peep = Peep.create(peep: params[:peep])
    current_user.peeps << peep
    current_user.save
  end

end
