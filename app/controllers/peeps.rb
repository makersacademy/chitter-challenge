class Chitter < Sinatra::Base
  post '/peep/new' do
    Peep.create(peep: params[:peep], timestamp: Time.new)
    redirect('/')
  end
end
