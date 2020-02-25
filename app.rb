require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './models/users.rb'
require './models/peeps.rb'

class Chitter < Sinatra::Base
    
    get '/' do
        'Chitter Home Page'
    end

end