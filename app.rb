require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
  @peeps = [
            "Dear diary",
            "Feeling blue",
            "Happy thoughts"
           ]
           erb :'peeps/index'
         end

  run! if app_file == $0
end
