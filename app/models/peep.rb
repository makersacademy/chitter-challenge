require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime, default: DateTime.now

  attr_reader :created_at

  belongs_to :user

  def time
    @created_at.strftime('%T %v')
  end
end
