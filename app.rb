require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter Away!'
  end

  get '/peeps' do
    peeps = [
      "hello everyone",
      "Still got this bloomin lurgy and high temperature.",
      "Why's he sniffing so much?",
      "I am in the curry house",
    ]
    peeps.join
  end

  run! if app_file == $0
end