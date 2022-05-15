require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('postgres://xxazaatnwnezpi:6bcf17beedd1646d930ce66b0b312f889173e15aafa1d71af749fafc71ff27fc@ec2-63-35-156-160.eu-west-1.compute.amazonaws.com:5432/d8vg8rk0k05gnf')
end
