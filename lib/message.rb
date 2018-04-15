require_relative './mapper.rb'

class Message
  include Mapper

  attr_reader :content, :time, :user_id

  def initialize params
    @user_id = params['user_id']
    @content = params['content']
    @time = params['time'] ? params['time'] : Time.now
  end

  def self.all
    (Mapper::all_messages).map { |data| new data }
  end

  def self.create params
    Mapper::new_message(Message.new(params))
  end
end
