# frozen_string_literal: true

require_relative 'database_connection'

class Peep
  def self.create(content:, user_id:)
    set_creation_time
    peep = DatabaseConnection.query("INSERT INTO peeps (content, date, time, user_id) VALUES('#{content}', '#{date}', '#{time}', '#{user_id}') RETURNING id, content, date, time, user_id").first
    create_object(peep)
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep|
      create_object(peep)
    end
  end

  def self.date
    creation_time.strftime("%d/%m/$Y")
  end

  def self.time
    creation_time.strftime("%H:%M")
  end

  class << self
    private
    attr_reader :creation_time

    def set_creation_time
      @creation_time = Time.new
    end

    def create_object(peep)
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        date: peep['date'],
        time: peep['time'],
        user_id: peep['user_id']
      )
    end
  end

  attr_reader :id, :content, :date, :time, :user_id

  def initialize(id:, content:, date:, time:, user_id:)
    @id = id
    @content = content
    @date = date
    @time = time
    @user_id = user_id
  end

end
# result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('anon', 'anon@example.com', 'anon_pass') RETURNING id").first
# time = Time.new
# DatabaseConnection.query("INSERT INTO peeps (content, date, time, user_id) VALUES('#{params[:peep]}', '#{time.strftime("%d/%m/$Y")}', '#{time.strftime("%H:%M")}', #{result['id']})")
