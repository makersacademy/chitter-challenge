def wipe_database
  Peep.delete_all
  User.delete_all
end
