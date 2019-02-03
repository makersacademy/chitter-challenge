require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/cheets' do
    "Being methodical and sensible I stick to the pomodoro technique To get much done in little time"
  end

  run! if app_file == $0
end
