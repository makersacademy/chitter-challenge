require 'byebug'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
    set :public_folder, Proc.new { File.join(root, 'static') }
  end

  enable :sessions, :methods_override

  get '/' do
    'Chitter Application'
  end

  run! if app_file == $0
end