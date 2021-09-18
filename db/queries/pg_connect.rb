require_relative 'postgres_db.rb'

# p 'env is? '
# p ENV['ENVIRONMENT']

module Postgres

  def connect
    # p 'env is? '
    # p ENV['ENVIRONMENT']

    if ENV['ENVIRONMENT'] == 'test'
      PGDatabase.connect('chitter_test')
    else
      PGDatabase.connect('chitter')
    end
  end



end

