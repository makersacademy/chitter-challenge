require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    messages = [
      "I love chitter!",
      "How do I peep?",
      "This is so fun."
    ]
    messages.join
  end

  run! if app_file == $0
end