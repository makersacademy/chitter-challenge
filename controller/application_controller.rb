require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../view', __FILE__)
  enable :sessions, :method_override

end
