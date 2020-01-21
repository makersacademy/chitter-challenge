$LOAD_PATH << './lib'
$LOAD_PATH << './app/controllers'
$LOAD_PATH << './app/models'

# Gems
require 'sinatra'
require 'pg'

# Models
require 'database_connection'
require 'email_client'
require 'message'


class Chitter < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, "../public") }

  DatabaseConnection.add_details(dbname: 'chitter', user: ENV['USER'], dbms: PG)
  EmailClient.setup
  Message.setup(dbconnection: DatabaseConnection, emailclient: EmailClient)


  get '/' do
    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if $0 == __FILE__
end
