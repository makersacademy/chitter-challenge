get '/' do
  @chit = Chit.all
  erb :index
end