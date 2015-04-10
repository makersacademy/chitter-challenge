get '/' do
  @blabbs = Blabbs.all
  erb :index
end