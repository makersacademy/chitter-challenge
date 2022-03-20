# :nocov:
class GoodVibes
  if File.exist?('good_vibes_pk.rb') 
    require_relative './good_vibes_pk'
    VIBES = GoodVibesPK::POSITIVE_AFFIRMATIONS
  else 
    VIBES = [
      "Everything is going to be alright"
    ].freeze
  end

  def self.vibe_check
    VIBES.sample
  end
end
# :nocov:
