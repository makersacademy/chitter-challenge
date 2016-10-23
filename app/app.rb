ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data-mapper-setup'

require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(content: params[:content])
  end


end
