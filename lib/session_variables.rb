# class to hold session variables and avoid using global variables
class SessionVariables
  def self.create(peep)
    @peep = peep
  end
  def self.peep
    @peep
  end
end
