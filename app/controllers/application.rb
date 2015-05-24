get '/' do
  @peep = Peep.all
  erb :index
end