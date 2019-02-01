require 'data_mapper'
require 'sinatra/base'
require_relative '../lib/ORM.rb'


class Chitter < Sinatra::Base

  get '/' do
    'hello world'
  end

end
