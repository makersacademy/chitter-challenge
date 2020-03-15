require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  # THIS CODE IS FOR THE FIRST STEP OF THE PROYECT, CREATE THE SIMPLIEST
  # MESSAGE POSSIBLE.
  # ---------------------
  # get '/' do
  #   "This is Chitter, your instant message service!"
  # end
  # ----------------------

  get '/' do
    # now the message is delivered in the erb file. index.erb
    # "This is Chitter, your instant message service!"
    erb :index
  end

  post '/peeps/new' do
    redirect '/peeps'
  end

  get '/peeps' do
    "New peep posted"
  end

run! if app_file == $0

end
