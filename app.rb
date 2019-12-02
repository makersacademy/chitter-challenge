# Controller for the web app. Each page is controlled by it's own GET / POST
require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base

  get '/' do
   erb :index
  end

 post '/peep' do
  
 end

run! if app_file == $0
end
