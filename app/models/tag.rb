class Tag

 include DataMapper::Resource

 property :id, Serial
 property :tag, String

 has n, :peeps, :through => Resource, constraint: :destroy

end
