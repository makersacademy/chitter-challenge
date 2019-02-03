require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/cheets' do
    @cheets = [
      "Being methodical and sensible",
      "I stick to the pomodoro technique",
      "To get much done in little time"
    ]
    erb :cheets
  end

  run! if app_file == $0
end
