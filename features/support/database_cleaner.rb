begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :transaction
end

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end