require 'sinatra/base'

class Chitter < Sinatra::Base
  get "/" do
    erb :"peeps/index"
  end

  run! if app_file ==$0
end

# To run (one or the other...)
# ruby app.rb
# rackup -p 4567
