def tag_user
  new_user
  user = User.find_by(name: "Guy")
  new_user('Ben', 'ben', 'ben@mail.com')
  peep = Peep.create(content: '@guy tagged', user_id: user.id)
  Tag.check(peep)
  [user, peep]
end
