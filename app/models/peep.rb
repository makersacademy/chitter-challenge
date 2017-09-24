class Peep
  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  # these property declarations set the column headers in the 'peeps' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :message,    String
  property :created_at, DateTime
end
