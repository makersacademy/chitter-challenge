require './lib/db_connection'
require 'pg'

class Peep

    attr_reader :peep, :chit

    def initialize(chit)
        @chit = chit
    end

    def display
        @chit
    end

    def self.create(arg)
        @peep = Peep.new(arg)
    end

    def self.instance
        @peep
    end

end

