class ChitterHandler
  DEFAULT_PEEPS = [
    "The first peep on Chitter!",
    "Coming up with fun examples is HARD..."
  ]

  class << self
    def retrieve_peeps
      DEFAULT_PEEPS
    end
  end
end
