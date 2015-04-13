get '/' do
  @blabbs = Blabbs.all
  puts flash[:notice] .inspect
  erb :index
end