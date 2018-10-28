RSpec.feature 'Viewing Chitter' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end

  scenario 'allows a user to sign up' do
    visit('/')
    fill_in('name',with: "Greg")
    fill_in('username',with:"Greg1")
    fill_in('email', with: "Greg@greg.com")
    fill_in('password', with: "Greg1")
    click_button('Submit')
    expect(page).to have_content 'Hello Greg'
  end

  scenario 'allows the user to post a peep' do
    visit('/peep/new')
    fill_in('peep',with: "Hello World")
    click_button('Submit')
    expect(page).to have_content 'Hello World'
  end

end
