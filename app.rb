require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/post-peep' do
    "post here"
  end

  get '/view-peeps' do
    "View all peeps here"
  end
  
  run! if app_file == $PROGRAM_NAME

end
