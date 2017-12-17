ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/time_line' do

  end

end
