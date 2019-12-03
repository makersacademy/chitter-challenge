# Controller for the web app. Each page is controlled by it's own GET / POST
require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base

  get '/' do
   p ENV
   erb :index
  end

 post '/peep' do
  @peeps = Peep.all
  erb :peep
 end

run! if app_file == $0
end
