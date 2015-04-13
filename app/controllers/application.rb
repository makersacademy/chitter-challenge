get '/' do
  @convos = Convo.all
  erb :home
end