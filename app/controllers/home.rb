class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :home
  end

end
