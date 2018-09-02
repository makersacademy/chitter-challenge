Capybara.app = ChitterChallenge

feature 'Viewing peeps' do
  scenario 'user can see pre-added peeps' do
    visit('/peeps')
    expect(page).to have_content "hello world!"
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
    visit('/register')
    fill_in :registration_email, with: 'james.malvern@gmail.com'
    fill_in :password, with: 'password'

    click_button 'Register'
    expect(page).to have_content 'james.malvern@gmail.com', 'james malvern'
  end
end