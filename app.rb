require 'sinatra'
require './lib/peeps'
# The main Chitter class for the app
class Chitter < Sinatra::Base
  enable :sessions

  # test page
  get '/test' do
    'Test page. Web infrastructure working'
  end

  get '/' do
    @peep = Peeps.peep_list
    erb :index
  end

  post '/peeps' do
    Peeps.post_peep(params[:peep])
    redirect '/'
  end

end
