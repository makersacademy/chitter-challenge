require_relative './database_connect'
require 'pg'

class Peeps

  extend DatabaseConnect

  attr_reader :peep, :created_at, :name, :user_name

  def initialize(peep:, created_at:, name:, user_name:)
    @peep = peep
    @created_at = created_at
    @name = name
    @user_name = user_name
  end

  def self.all
    result = database_connect.exec("SELECT peep, created_at, name, user_name FROM peeps JOIN users ON (peeps.user_id=users.id) ORDER BY peeps.id;")
    result.map do |peeps|
      Peeps.new(peep: peeps['peep'], created_at: peeps['created_at'], name: peeps['name'], user_name: peeps['user_name'])
    end
  end

  def self.create(peep, current_user_id)
    database_connect.exec("INSERT INTO peeps (peep, created_at, user_id) VALUES($txt$#{peep}$txt$, '#{created_time}', '#{current_user_id}');")
  end

  def self.created_time
    return Time.at(Time.now.to_i).strftime("%B %e, %Y at %I:%M %p")
  end

end
