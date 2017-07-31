# require 'data_mapper'
# require 'dm-postgres-adapter'

# this class corresponds to a table in the database
class Peep

  # add datamapper functionality to this class so it can communicate with the database
  include DataMapper::Resource
  belongs_to :user
  # these property declarations set the column headers in the peeps table
  property :id,         Serial # auto incremented for every record/only used once
  property :name,       String
  property :username,   String
  property :peep,       String
  property :created_at, DateTime
  property :user_id,    Integer

end

# # connect to database:
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# # check everything in model is ok:
# DataMapper.finalize
# # build any new columns or tables we added
# DataMapper.auto_upgrade!
