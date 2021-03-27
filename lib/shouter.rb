class Shouter

  def self.setup
    @@shouts = []
  end

  def self.all
    @@shouts
  end

  def self.shout(shout_content, author = 'Solo')
    @@shouts.unshift([author, Time.now, shout_content])
  end
end
