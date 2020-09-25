require "sinatra/base"

class Shore < Sinatra::Base
  enable :method_override

  get '/' do
    'Shore'
  end



  run! if app_file == $0
end