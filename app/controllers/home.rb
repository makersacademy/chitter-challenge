class Chitter < Sinatra::Base
  get '/' do
    @peep = Peep.all
    erb :index
  end
end
