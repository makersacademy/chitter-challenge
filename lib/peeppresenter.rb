require './lib/timeago'
class PeepPresenter
  def self.run(peep)
    PeepPresenter.new(TimeAgo).run(peep)
  end

  def initialize(time_ago_klass)
    @time_ago_klass = time_ago_klass
  end

  def run(peep)
    present(peep)
  end
private

  def present(peep)
    "'#{body_text(peep)}' #{time_posted(peep)} ago from #{name_of_peeper(peep)}"
  end

  def body_text(peep)
    peep.body
  end

  def time_posted(peep)
    p "peep: #{peep}"
    p "created at: #{peep.created_at}"
    @time_ago_klass.run(peep.created_at - 1)
  end

  def name_of_peeper(peep)
    peep.user.first_name
  end

end