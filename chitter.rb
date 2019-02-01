require 'sinatra'
require './lib/peeps.rb'

enable :sessions, :method_override

class ChitterApp < Sinatra::Base

  get '/' do
    erb(:index)
  end
end
