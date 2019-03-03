require 'pg'

  if ENV['CHITTER_ENVIRON'] == 'test'
    PG.connect('chitter_test')
  else
    PG.connect('chitter')
  end
