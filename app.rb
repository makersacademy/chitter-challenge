require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter Away!'
  end

  get '/peeps' do
    # @peeps = [
    #   "hello everyone",
    #   "Still got this bloomin lurgy and high temperature.",
    #   "Why is he sniffing so much?",
    #   "I am in the curry house",
    # ]
    @peeps = Peeps.all
    erb :'peeps/peep_list'
  end

  run! if app_file == $0
end