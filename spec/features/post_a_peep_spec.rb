feature 'Post a peep' do

  let(:user) do
    User.create(username: 'user1',
                email: 'hi@email.com',
                password: 'test',
                password_confirmation: 'test')
  end
  let(:message) { 'This is my first peep!' }

  scenario 'User can post a message' do
    sign_in(user.username, user.password)
    expect { peep(message)}.to change(Peep, :count).by 1
  end

  scenario 'Peep is visible when posted' do
    sign_in(user.username, user.password)
    peep(message)
    expect(page).to have_content message
  end

  scenario 'Peeps show which user they were posted by' do
    sign_in(user.username, user.password)
    peep(message)

    within 'ul#peeps' do
      expect(page).to have_content user.username
    end
  end

end
