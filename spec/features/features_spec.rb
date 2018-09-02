Capybara.app = ChitterChallenge

feature 'Viewing peeps' do
  scenario 'user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "i am the peep_spec test"
  end
end

feature 'Adding peeps' do
  scenario 'user can create a peep' do
    visit('peeps/new')
    fill_in :peep_input, with: 'I do hope this works'
    click_button 'Peep!'
    expect(page).to have_content 'I do hope this works'
  end
end

feature 'Registering users' do
  scenario 'user can register' do
    visit('/users/new')
    fill_in :registration_email, with: 'peeper@gmail.com'
    fill_in :password, with: 'password'

    click_button 'Register'
    expect(page).to have_content 'peeper@gmail.com', 'password'
  end
end
