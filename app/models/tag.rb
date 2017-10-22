class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :peeps, :through => Resource

  def self.parse_tags(peep)
    peep.scan(/[#]\S+/)
  end

end
