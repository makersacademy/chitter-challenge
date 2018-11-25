require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to the peep show"
  end

  get '/peeps' do
    peeps = [
      "This is a peep",
      "This is another peep",
      "Third peep here"
    ]
  end

  run! if app_file == $0

end
