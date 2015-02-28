get '/' do 
  @hoots = Hoot.all 
  erb :index
end