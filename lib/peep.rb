class Peep
  attr_reader :peep, :peeped_at

  def initialize(peep, peeped_at)
    @peep = peep
    @peeped_at = DateTime.parse(peeped_at).strftime("%d/%m/%Y %H:%M")
  end

  def self.create(peep)
    time = Time.now
    peeps = DatabaseConnection.query(
      "INSERT INTO peeps(peep, peeped_at, nanosecs) VALUES ($1, $2, $3);", 
      [peep, time, time.nsec]
    )
  end

  def self.show
    peeps = DatabaseConnection.query(
      "SELECT * FROM peeps ORDER BY peeped_at DESC, nanosecs DESC;"
    )
    peeps.map { |peep| Peep.new(peep['peep'], peep['peeped_at']) }
  end
end
