feature 'form to sign up to chitter' do
  scenario 'can sign up to chitter and receive a confirmation' do
    sign_up_as_penelope
    expect(page).to have_content 'Welcome to Chitter, penelopeheartsyou'
    expect(page).to have_link 'Compose a peep'
  end

  scenario 'can sign up and receive personalised confirmation' do
    sign_up_as_john
    expect(page).to have_content 'Welcome to Chitter, johnjohn!'
    expect(page).not_to have_content 'Welcome to Chitter, penelopeheartsyou'
    expect(page).to have_link 'Compose a peep'
  end

  scenario 'shows no confirmation if you have not signed up' do
    visit '/chitter'
    click_on 'Join Chitter'
    expect(page).not_to have_content 'Welcome to Chitter,'
  end
end
