require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    "Chitter!!"
  end

  get '/peeps' do
    peeps = { username: "timmy_toes", peep: "I love this new app Chitter" }
    p peeps
  end

  # establish server if file run directly
  run! if app_file == $0
end
