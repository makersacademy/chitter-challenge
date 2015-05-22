get '/' do
  @blabbs = Blabb.all
  puts flash[:notice] .inspect
  erb :index
end