feature 'Peeps' do

  scenario 'A user can view a peep' do
    visit('/')
    expect(page).to have_content "Hello, this is my first peep"
  end

  scenario 'Adding a peep' do
    visit('/chitter')
    click_button('Add user')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Submit')
    click_button('Sign in')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Sign in')
    fill_in('content', with: 'This is my second peep')
    click_button('Add peep')
    expect(page).to have_content "This is my second peep"
  end
end
