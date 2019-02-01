require 'bundler/setup'
require 'sinatra/base'
require './lib/chitter_messages'

class Chitter < Sinatra::Base

  set :views, Proc.new { File.join(root, "Public/views") } # Sets the 'views' folder path from root directory
  set :public_folder, File.dirname(__FILE__)

  @@chitter_database

  get ('/') do
    new_database_connection
    @all_messages = @@chitter_database.all
    erb(:index)
  end

  post ('/submit-message') do
    @message = params[:"Messages"]
    @@chitter_database.add_chitter_message(@message)
    redirect('/')
  end

  private

  def new_database_connection
    @@chitter_database = ChitterMessages.new("chitter")
  end

end
