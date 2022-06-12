class Peep

  def self.all
    @peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep"
    ]
    @peeps.reverse
  end

end