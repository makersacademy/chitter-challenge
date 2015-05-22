class Chitter

  get '/' do
    @peeps = Peep.all
    erb :index
  end

end
