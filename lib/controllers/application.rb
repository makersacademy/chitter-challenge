class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

end
