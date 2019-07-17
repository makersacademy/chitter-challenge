require 'sinatra/base'
# require_relative './models/chitter'

class ApplicationManager < Sinatra::Base

  get '/' do
  end

  run! if app_file == $0

end