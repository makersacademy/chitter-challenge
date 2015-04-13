class Chitter

  register Sinatra::Reloader

  get '/' do
    @peeps = Peep.all
    erb :index
  end

end
