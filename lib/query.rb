require 'pg'
require_relative './exceptions.rb'
require 'dotenv'
Dotenv.load

class Query

  def self.run(query_string)
    results = PG.connect(dbname: "chitter#{ENV['ENVIRONMENT']}", user: "#{ENV['PG_USERNAME']}", password: "#{ENV['PG_PASSWORD']}").exec(query_string)
    results.map { |result| result.transform_keys(&:to_sym) }
  end

end
