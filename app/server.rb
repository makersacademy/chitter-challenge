class Chitter < Sinatra::Base
  set :root, File.dirname(__FILE__)

  run! if app_file == $0
end
