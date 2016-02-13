feature 'Replying peeps' do
  before do
    user = User.create(
      username: 'otheruser',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'other@myemail.com',
      name: 'Other User')
    Peep.create(
      message: 'This peep needs a response',
      datetime: Time.now,
      user: user)
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'User can reply to a peep' do
    sign_in
    visit('/peeps')
    click_button('Reply')
    fill_in :message, with: 'This is my reply'
    click_button('Post')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('This peep needs a response')
    expect(page).to have_content('This is my reply')
  end
end
