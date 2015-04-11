get '/' do
  @peeps = Peep.all
  erb :index
end