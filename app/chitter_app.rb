require 'rubygems'
require 'sinatra/base'
require_relative 'datamapper_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  helpers do
    def formatted_time_stamp(time_stamp)
      time_stamp.ctime
    end
  end
end