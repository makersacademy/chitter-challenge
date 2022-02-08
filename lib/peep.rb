# frozen_string_literal: true

class Peep
  attr_reader :peep, :user_email, :time

  def initialize(peep, user_email, time)
    @peep = peep
    @user_email = user_email
    @time = time
  end

  def timestamp
    DateTime.parse(@time).strftime('%c')
  end
end
