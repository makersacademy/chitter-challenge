class User
  attr_accessor :id, :fname, :lname

  def initialize(id:,fname:,lname:)
    @id = id
    @fname = fname
    @lname = lname
  end

end
