feature 'form to sign up to chitter' do
  scenario 'can sign up to chitter and receive a confirmation' do
    visit '/chitter'
    click_on 'Join Chitter'
    fill_in 'Name', with: 'Penelope Heart'
    fill_in 'Email', with: 'penel<3@makers.com'
    fill_in 'username', with: 'penelopeheartsyou'
    fill_in 'password', with: 'SweetHeart321'
    click_on 'Submit'
    expect(page).to have_content 'Welcome to Chitter, penelopeheartsyou'
    expect(page).to have_link 'Compose a peep'
  end
end
