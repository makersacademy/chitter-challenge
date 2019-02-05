# frozen_string_literal: true

require 'pg'
require_relative './email'

# creates peeps to display on the peep feed
class Peep
  attr_reader :username, :name, :content, :created

  def initialize(username, name, content, created)
    @username = username
    @name = name
    @content = content
    @created = created
  end

  def self.all
    results = sql_query('
      SELECT users.username, users.name, peeps.content, peeps.created
      FROM peeps
      INNER JOIN users ON peeps.user_id=users.user_id
      ORDER BY peeps.created DESC;
    ')
    results.map do |one|
      Peep.new(one['username'], one['name'], one['content'], one['created'])
    end
  end

  def self.post_peep(user_id, username, content)
    sql_query('
      INSERT INTO peeps (user_id, content)
      VALUES($1, $2);
    ', [user_id, content])
    words = content.gsub(/[,.;:?!)\-\]\}]/, ' ').tr(' ', ' ').split(' ')
    Email.mentions(username, words)
  end

  def since
    the_present = Time.now
    the_past = Time.parse(created)
    time_elapsed = the_present - the_past
    seconds = time_elapsed.round
    ago_message(seconds)
  end

  def ago_message(seconds)
    if seconds < 60
      seconds_ago(seconds)
    elsif seconds < 3_600
      minutes_ago(seconds)
    elsif seconds < 86_400
      hours_ago(seconds)
    else
      days_ago(seconds)
    end
  end

  def seconds_ago(seconds)
    if seconds < 1
      'just now'
    elsif seconds < 2
      "#{seconds} second ago"
    else
      "#{seconds} seconds ago"
    end
  end

  def minutes_ago(seconds)
    if seconds < 120
      "#{(seconds / 60).round} minute ago"
    else
      "#{(seconds / 60).round} minutes ago"
    end
  end

  def hours_ago(seconds)
    if seconds < 7_200
      "#{(seconds / 60 / 60).round} hour ago"
    else
      "#{(seconds / 60 / 60).round} hours ago"
    end
  end

  def days_ago(seconds)
    if seconds < 172_800
      "#{(seconds / 60 / 60 / 24).round} day ago"
    else
      "#{(seconds / 60 / 60 / 24).round} days ago"
    end
  end

  def self.sql_query(query, params = nil)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec(query, params)
  end
end
