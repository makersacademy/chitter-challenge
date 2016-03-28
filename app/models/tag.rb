class Tag
  include DataMapper::Resource

    property :id, Serial
    property :name, String, length: 40

    has n, :peeps, through: Resource
end
