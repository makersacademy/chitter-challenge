require "peep_class"

class PeepRepository
  def initialize
   
    @library = [] # ...
  end

  def add(peep) # peep is an instance of Peep 
    
    @library << peep 
    # Peep gets added to the library
    # Returns nothing
    
  end

  def all
    # Returns a list of all peep objects in reverse chronological orde rot when they were submitted
    return @library 
    
  end
  
end 