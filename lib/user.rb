class User
  # attr_reader :name

  # def initialize(name)
  #   @name = name
  # end

  def self.create(name)
    @name = name
  end

  def self.name
    @name
  end

end 