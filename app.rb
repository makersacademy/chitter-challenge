require 'sinatra/base'
require './lib/makers'

class Chitter < Sinatra::Base
  # enable :sessions
  # attr_reader :username

  get '/' do
    erb(:new_user)
  end

  post '/completed_reg_form' do
    username = params[:Username]
    email_address= params[:Email_Address]
    password = params[:Password]
    connection = PG.connect(dbname: 'chitter_members_test')
    connection.exec("INSERT INTO chitter_members_data (username, email_address, password) VALUES('#{username}', '#{email_address}', '#{password}')")
    redirect '/welcome_to_chitter'
  end

  get '/welcome_to_chitter' do
    erb(:welcome_to_chitter)
  end

  run! if app_file == $0

end
