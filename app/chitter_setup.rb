# app/data_mapper_setup.rb
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/tag'
require 'dotenv'
Dotenv.load

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_upgrade!
DataMapper.finalize

require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV['CHITTER_GMAIL_USERNAME'],
    password: ENV['CHITTER_GMAIL_PASSWORD'],
    authentication: :plain,
    enable_starttls_auto: true
  }
end

# set :public_folder, Proc.new { File.join(root, 'static') }
