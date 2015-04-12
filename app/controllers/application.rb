class Chitter

  get '/' do
    @peeps = Peep.all order: [:date_time.desc]
    erb :index
  end

end