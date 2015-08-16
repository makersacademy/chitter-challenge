require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'
require 'byebug'

class Chitter < Sinatra::Base
end

Dir.glob("#{File.dirname(__FILE__)}/controllers/*.rb").each do |file|
  require file.chomp(File.extname(file))
end

class Chitter
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

end
