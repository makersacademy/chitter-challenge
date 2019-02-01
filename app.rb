ENV['database_hash'] ||= 'chipchune'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/beep.rb'

puts "So here we're in the test"
Beep.all.each { |x| print x}

class ChipChune < Sinatra::Base

  get '/' do
    puts "here we go again"
    puts ENV['database_hash']
    @beeps = Beep.all

    puts ENV['database_hash']
    erb(:pixelstream)
  end

  post '/' do
    Beep.create(body: params['beep'])
    redirect '/'
  end
end
