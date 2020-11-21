require 'sinatra'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    'Welcome To Chitter'
  end

  run! if app_file == $0
end
