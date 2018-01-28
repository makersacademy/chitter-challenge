module CheetHelpers

  def create_cheet(user = 'test@test.com',
          message = 'my first cheet',
          message_created = '2018-01-28 14:36:47 +0000'
        )
    Cheets.create(user: user, message: message, message_created: message_created )
  end
end
