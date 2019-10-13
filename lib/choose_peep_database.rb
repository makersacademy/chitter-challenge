def which_peep_database
  if ENV['ENVIRONMENT'] == 'test'
    return 'test_chitter_database'
  else
    return 'chitter_database'
  end
end
