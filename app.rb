ENV['database_hash'] ||= 'chipchune'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/beep.rb'

class ChipChune < Sinatra::Base

  get '/' do
    @beeps = Beep.order(time: :desc)
    erb(:pixelstream)
  end

  post '/' do
    Beep.create(body: params['beep'])
    redirect '/'
  end
end
