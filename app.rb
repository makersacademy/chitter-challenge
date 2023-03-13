require 'date'
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'

DatabaseConnection.connect('chitter')

p Time.now.round

repo = MakerRepository.new

puts repo.all