$LOAD_PATH << './lib'
$LOAD_PATH << './app/controllers'
$LOAD_PATH << './app/models'

require 'sinatra/base'
require 'database_connection'

class Chitter < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "../public") }

  DatabaseConnection.add_details(dbname: 'chitter', user: ENV['USER'], dbms: PG)

  get '/' do
    erb :homepage
  end




  # before filters

  # start the server if ruby file executed directly
  run! if $0 == __FILE__
end
