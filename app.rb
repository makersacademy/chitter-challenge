require 'bundler/setup'
require 'sinatra/base'
require './lib/chitter_messages'

class Chitter < Sinatra::Base

  set :views, Proc.new { File.join(root, "Public/views") } # Sets the 'views' folder path from root directory
  set :public_folder, File.dirname(__FILE__)

  @@chitter_wrapper
  @@user_chitters
  @@user_name
  @@user_password
  @@sign_up_status

  get ('/') do
    erb(:index)
  end

  post ('/log-in') do
    @@user_name = params[:"user_name"]
    @@user_password = params[:"password"]
    if ChitterDatabase.check_user_details("chitter", "users", @@user_name, @@user_password) == true
      new_chitter_wrapper("chitter", "chitter_messages")
      redirect ('/chitters')
    else
      redirect ('/')
    end
  end

  get ('/chitters') do
    @@user_chitters = @@chitter_wrapper.all(@@user_name, @@user_password)
    @chitters = @@user_chitters
    erb(:chitters)
  end

  post ('/submit-chitter') do
    @message = params[:"Chitter"]
    @@chitter_wrapper.add_chitter_message(@message, @@user_name, @@user_password)
    redirect('/chitters')
  end

  get ('/sign-up') do
    erb(:sign_up)
  end

  get ('/log-out') do
    @@chitter_wrapper.log_out
    redirect('/')
  end

  get ('/sign-up-status') do
    @sign_up_check = @@sign_up_status
    erb(:sign_up_status)
  end

  post ('/sign-up-authorisation') do
    @new_user = params[:"new_user_name"]
    @new_user_password = params[:"new_user_password"]
    new_chitter_wrapper("chitter", "users")
    @@chitter_wrapper.add_new_user("chitter", "users", @new_user, @new_user_password)
    @@sign_up_status = true
    redirect ('/sign-up-status')
  end

  private

  def new_chitter_wrapper(database_name, database_table)
    @@chitter_wrapper = ChitterMessages.new(database_name, database_table)
  end

end
