get '/' do
  @users = User.all
  p current_user
  @peeps = Peep.all
  erb :index
end