def database_wiper
  Beep.destroy_all unless ENV['database_hash'] == 'chipchune'
  User.destroy_all unless ENV['database_hash'] == 'chipchune'
end
