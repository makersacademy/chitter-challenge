feature 'Replying to a peep' do
  let!(:user) do
    User.create(name: 'Katie', username: 'KS', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')
  end

  let(:text) { "Hi, I am using Chitter!" }

  scenario 'a logged in user can reply to a peep' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    fill_in :reply, with: "And this is my reply"
    click_button 'Reply!'
    within '#reply' do
      expect(page).to have_content "And this is my reply"
    end
  end

  scenario 'the reply box does not appear if not logged in' do
    sign_up(user)
    log_in(user.username, user.password)
    peep(text)
    click_button('Sign out')
    visit('/peeps')
    page.assert_no_selector('#reply_form')
  end
end
