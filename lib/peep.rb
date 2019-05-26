require_relative './database_connection'
require 'time'

class Peep
  attr_reader :id, :message, :sent_time

  def initialize(id:, message:, sent_time:)
    @id = id
    @message = message
    @sent_time = sent_time
  end

  def self.send(message:)
    peep_record = (DatabaseConnection.query \
      "INSERT INTO peeps (message, sent_time) " + \
      "VALUES('#{message}', '#{Time.now}') " + \
      "RETURNING id, message, sent_time;").first

    to_peep(peep_record)
  end

  def self.all
    peep_records = DatabaseConnection.query \
      "SELECT * FROM peeps ORDER BY sent_time DESC;"
    peep_records.map { |peep_record| to_peep(peep_record) }
  end

  def eql?(other_peep)
    return false if other_peep.nil?
    return false unless other_peep.is_a?(Peep)

    @id == other_peep.id \
    && @message = other_peep.message \
    && @sent_time = other_peep.sent_time
  end

  def ==(other_peep)
    eql?(other_peep)
  end

  def !=(other_peep)
    !eql?(other_peep)
  end

  private_class_method

  def self.to_peep(peep_record)
    Peep.new(id: peep_record["id"], \
    message: peep_record["message"], \
    sent_time: Time.parse(peep_record["sent_time"]))
  end
end
