feature 'Replying to a peep' do
  let!(:user) do
    User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  let(:text) { "Hi, I am using Chitter!" }

  scenario 'a user can post a reply to a peep' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    fill_in :reply, with: "And this is my reply"
    click_button 'Reply!'
    expect(page).to have_content "And this is my reply"
  end
end
