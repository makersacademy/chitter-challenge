class Chitter < Sinatra::Base
  post '/peep/new' do
    Peep.create(peep: params[:peep])
    redirect('/')
  end
end
