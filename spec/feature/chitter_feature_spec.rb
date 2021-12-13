feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'CHITTER'
  end
end

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :name, with: 'Bryn'
    fill_in :email, with: 'Bryn@email.co.uk'
    click_button 'sign in'
    expect(page).to have_content 'Hi Bryn'
  end
end

feature 'Entering first peep' do
  scenario 'Entering first peep' do
    visit('/')
    fill_in :name, with: 'Bryn'
    fill_in :email, with: 'Bryn@email.co.uk'
    click_button 'sign in'
    fill_in :peep, with: 'Hello, everyone'
    click_button 'peep it!'
    expect(page).to have_content 'Hello, everyone'
  end
end

feature 'Signing out' do
  scenario 'Signing out' do
    visit('/')
    fill_in :name, with: 'Bryn'
    fill_in :email, with: 'Bryn@email.co.uk'
    click_button 'sign in'
    fill_in :peep, with: 'Hello, everyone'
    click_button 'peep it!'
    click_button 'logout'
    expect(page).to have_content 'Sign in'
  end
end

feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter_login' do
    visit('/')
    fill_in :name, with: 'Bryn'
    fill_in :email, with: 'Bryn@email.co.uk'
    click_button 'sign in'
    fill_in :peep, with: 'Hello, everyone'
    click_button 'peep it!'
    fill_in :peep, with: 'whats up'
    click_button 'peep it!'

    expect(page).to have_content 'whats up'
  end
end