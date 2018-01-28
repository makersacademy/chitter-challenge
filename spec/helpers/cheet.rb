module CheetHelpers

  def create_cheet(cheet_user = 'test@test.com',
          message = 'my first cheet',
          message_created = '2018-01-28 14:36:47 +0000'
        )
    Cheets.create(cheet_user: cheet_user, message: message, message_created: message_created)
  end
end
