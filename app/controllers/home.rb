class Chitter < Sinatra::Base

  get '/home' do
    @peeps = Peep.all.reverse
    erb :'home/index'
  end
  
end
