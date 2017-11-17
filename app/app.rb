require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative './data_mapper_setup'

class Chitter < Sinatra::base
  configure do
    enable :sessions
    set :session_secret, 'bob now has no legs at all'
    set :public_folder, Proc.new { File.join(root, 'static') }
    register Sinatra::Flash
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end
end



