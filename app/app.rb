ENV["RACK_ENV"] = "test"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'/timeline/index'
  end

  post '/' do
    peep = Peep.new(body: params[:peep_body], time: '2017-08-26 10:28:19 +010')
    peep.save
    redirect '/'
  end
end
