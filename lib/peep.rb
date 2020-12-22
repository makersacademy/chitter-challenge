class Peep

  @@all_peeps = []

  # to reset array before each test run
  def self.empty_peeps
    @@all_peeps = []
  end

  def self.all
    @@all_peeps
  end

  def self.add(content)
    @@all_peeps << content
  end

end
