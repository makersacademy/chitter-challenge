feature 'View peeps' do
  scenario 'Peeps are displayed on home page in reverse chronological order' do
    message1 = 'This is the first peep'
    message2 = 'This is the second'
    message3 = 'And a third in case'

    register_user
    user = UserService.current_user

    PeepService.post(message1, user.username)
    PeepService.post(message2, user.username)
    PeepService.post(message3, user.username)

    visit '/'
    expect(message3).to appear_before(message2, only_text: true)
    expect(message2).to appear_before(message1, only_text: true)
  end
end
