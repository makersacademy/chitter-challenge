def initialise_test_database
  DataMapper.auto_migrate!
  user_1 = User.create(
    name: 'Test User 1',
    username: 'test_user_1',
    email: 'test@user.one',
    password: 'password_1'
  )
  user_2 = User.create(
    name: 'Test User 2',
    username: 'test_user_2',
    email: 'test@user.two',
    password: 'password_2'
  )
  user_3 = User.create(
    name: 'Test User 3',
    username: 'test_user_3',
    email: 'test@user.three',
    password: 'password_3'
  )
  user_1_peep_1 = Peep.create(
    peep_time: Time.parse('2018-09-29 12:45:08'),
    peep: 'User 1 Peep 1'
  )
  user_1_peep_2 = Peep.create(
    peep_time: Time.parse('2018-09-29 15:42:19'),
    peep: 'User 1 Peep 2'
  )
  user_1_peep_3 = Peep.create(
    peep_time: Time.parse('2018-09-29 19:12:01'),
    peep: 'User 1 Peep 3'
  )
  user_2_peep_1 = Peep.create(
    peep_time: Time.parse('2018-09-29 11:56:44'),
    peep: 'User 2 Peep 1'
  )
  user_2_peep_2 = Peep.create(
    peep_time: Time.parse('2018-09-29 16:19:07'),
    peep: 'User 2 Peep 2'
  )
  user_3_peep_1 = Peep.create(
    peep_time: Time.parse('2018-09-29 17:04:26'),
    peep: 'User 3 Peep 1'
  )
  user_1_peep_1.user = user_1
  user_1_peep_2.user = user_1
  user_1_peep_3.user = user_1
  user_2_peep_1.user = user_2
  user_2_peep_2.user = user_2
  user_3_peep_1.user = user_3
  user_1_peep_1.save
  user_1_peep_2.save
  user_1_peep_3.save
  user_2_peep_1.save
  user_2_peep_2.save
  user_3_peep_1.save
end
