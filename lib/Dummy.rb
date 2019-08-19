class Dummy

  attr_reader :name, :pass, :details

  def initialize(name, pass)
    @name = name
    @pass = pass
    @details = {"username" => name, "password" => pass }
  end


end
