require 'require_all'
require_all 'app/models'

users = [
  { name: 'S. A. McQuanzie',
    username: 'mcquanzie',
    email: 'mcquanzie@example.com',
    password: 'V3ryS3cur3P4ssw0rd'
  },

  { name: 'David',
    username: 'xX_DaRk_SpIrIt_Xx',
    email: 'superdave__123@hotmail.com',
    password: 'V3ryS3cur3P4ssw0rd'
  }
]

users.each { |user| User.create(user) }
