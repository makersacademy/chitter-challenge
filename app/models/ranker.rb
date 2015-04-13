module Ranker
  def self.rank(cheeps)
    cheeps.sort_by { |cheep| rating(cheep) }
  end

  private

  def self.age(cheep)
    (Time.now - cheep.time_stamp).ceil
  end
  def self.rating(cheep)
    cheep.applause.length.to_f / Math.sqrt(age(cheep).to_f)
  end
end