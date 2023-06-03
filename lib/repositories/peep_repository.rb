require_relative '../models/peep'
require 'database_connection'

class PeepRepository
  def self.create(content, timestamp, user_id)
    query = "INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);"
    DatabaseConnection.exec_params(query, [content, timestamp, user_id])

    return nil
  end

  def self.find(peep_id)
    query = "SELECT id, content, timestamp, user_id FROM peeps WHERE id = $1;"
    result = DatabaseConnection.exec_params(query, [peep_id])

    build_peep(result[0])
  end

  def self.all
    peeps = []
    query = "SELECT id, content, timestamp, user_id FROM peeps;"
    result = DatabaseConnection.exec_params(query, [])
    result.each do |inst|
      peeps << build_peep(inst)
    end
    peeps
  end

  def self.sort_by_timestamp(peeps)
    peeps.sort_by! { |peep| peep.timestamp }
  end

  def self.find_by_user(user_id)
    peeps = []
    query = "SELECT id, content, timestamp, user_id FROM peeps WHERE user_id = $1;"
    result = DatabaseConnection.exec_params(query, [user_id])
    result.each do |inst|
      peeps << build_peep(inst)
    end
    peeps
  end

  def self.update(content, id)
    query = "UPDATE peeps SET content = $1 WHERE id = $2;"
    DatabaseConnection.exec_params(query, [content, id])
  end

  def self.delete(id)
    query = "DELETE FROM peeps WHERE id = $1;"
    DatabaseConnection.exec_params(query, [id])

    return nil
  end

  private

  def self.build_peep(inst)
    return nil if inst.nil?
    peep = Peep.new
    peep.id = inst['id'].to_i
    peep.content = inst['content']
    peep.timestamp = inst['timestamp']
    peep.user_id = inst['user_id'].to_i
    return peep
  end
end
