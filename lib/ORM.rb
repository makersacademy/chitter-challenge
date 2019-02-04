require_relative '../lib/maker.rb'
require_relative '../lib/peep.rb'

DataMapper::Logger.new($stdout, :debug)

postgres_user = "david"

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, "postgres://#{postgres_user}@localhost/chitter_test")
else
  DataMapper.setup(:default, "postgres://#{postgres_user}@localhost/chitter")
end

DataMapper.finalize
DataMapper.auto_upgrade!

example_maker = Maker.create(
  :displayname => "Makers5ever",
  :username => "makers5ever",
  :email => "makers@makers.com",
  :password => "secret"
)

example_peep = example_maker.peeps.create(
  :peeptext => "Can't believe I took so long to join Chitter!",
  :timestamp => Time.new
)
