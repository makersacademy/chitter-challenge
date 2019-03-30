require 'sinatra/base'


class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do 
  'testing'
  end










  run! if app_file == $0
end 
