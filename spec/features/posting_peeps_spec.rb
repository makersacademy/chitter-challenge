feature 'Posting peeps' do
  before do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'User can post a peep' do
    sign_in
    visit('/peeps/new')
    fill_in :message, with: 'This is my peep'
    click_button('Post')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('This is my peep')
  end

  scenario 'User needs to login before posting' do
    visit('/peeps/new')
    expect(page).to have_content('Please sign in to post a peep.')
  end
end
