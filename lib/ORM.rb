require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://david@localhost/chitter')

class Maker
  include DataMapper::Resource

  has n, :peeps

  property :id,           Serial, :key => true
  property :displayname,  String
  property :username,     String
end

class Peep
  include DataMapper::Resource

  belongs_to :maker

  property :id,           Serial, :key => true
  property :peeptext,     Text
  property :timestamp,   DateTime
end

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
