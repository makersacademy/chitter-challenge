require_relative './mapper.rb'

class Message
  include Mapper

  attr_reader :content, :time

  def initialize params
    @content = params['content']
    @time = params['time'] ? params['time'] : Time.now
    user_id = params['user_id']
  end

  def self.all
    (Mapper::all_messages).map { |data| new data }
  end
end
