# Controller for the web app. Each page is controlled by it's own GET / POST
require 'sinatra/base'
class Chitter < Sinatra::Base

  get '/' do
   'Hello World'
  end

run! if app_file == $0
end
