get '/' do
 @users = User.all
 @peeps = Peep.all
 erb :index
end