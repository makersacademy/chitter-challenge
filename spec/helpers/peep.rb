module PeepHelpers

  def create_peep(peep_user = 'test@test.com',
          message = 'my first peep',
          message_created = '2018-01-28 14:36:47 +0000'
        )
    Peeps.create(peep_user: peep_user, message: message, message_created: message_created)
  end
end
