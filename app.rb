require 'sinatra/base'


class Chitter < Sinatra::Base


  
  get '/' do
    'I am the best president OF ALL TIME!'
  end

  run! if app_file == $PROGRAM_NAME
end