class PeepManager
    def self.instance
      @instance ||= self.new
    end
  
    def initialize
      @peeps = []
    end
  
    def add_peep(peep)
      @peeps << peep
    end
  
    def all_peeps
      @peeps
    end
  
  end