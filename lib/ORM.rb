require_relative '../lib/maker.rb'
require_relative '../lib/peep.rb'

DataMapper.finalize
DataMapper.auto_migrate!

example_maker = Maker.create(
  :displayname => "Makers5ever",
  :username => "makers5ever"
)

example_peep = example_maker.peeps.create(
  :peeptext => "Can't believe I took so long to join Chitter!",
  :timestamp => Time.new
)
