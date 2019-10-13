def which_user_database
  if ENV['ENVIRONMENT'] == 'test'
    return 'test_chitter_username_database'
  else
    return 'chitter_username_database'
  end
end
