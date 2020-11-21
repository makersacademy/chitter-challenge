require 'sinatra'
require_relative './database_connection_setup'
class Chitter < Sinatra::Base

  run if app_file == $0
end
