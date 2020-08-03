

require 'sinatra/base'
require 'sinatra/flash'

class ChitterChallenge < Sinatra::Base #basic sinatra application

  register Sinatra::Flash #extension that lets you store information between requests.
  enable :sessions #?


  get '/' do # define a route
    @user = User.find(session[:user_id])
    @message = Peep.read
  erb :index

  end
   run! if app_file == $PROGRAM_NAME
end
