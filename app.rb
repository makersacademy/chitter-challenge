require 'sinatra'

class Chitter < Sinatra::Base
enable :sessions

run! if app_file == $PROGRAM_NAME


end
