require 'rubygems'
require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end