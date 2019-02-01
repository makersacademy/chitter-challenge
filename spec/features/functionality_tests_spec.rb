require_relative 'web_helpers'

feature '#Homepage' do
  scenario 'Loads the default homepage when taken to /' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "User Login"
    expect(page).to_not have_content "Peep"
  end
end

feature '#New User' do
  scenario 'Registers a new user' do
    visit '/'
    fill_in_registration
    click_button('Register')
    expect(page).to have_current_path('/')
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "User Login"
    expect(page).to_not have_content "Peep"
  end

  scenario 'Takes user back to homepage if cancel is clicked' do
    visit '/'
    fill_in_registration
    click_button('Cancel')
    expect(page).to have_current_path('/')
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "User Login"
    expect(page).to_not have_content "Peep"
  end
end

feature '#Login' do
  scenario 'Users successfully logs in' do
    visit '/'
    fill_in_registration
    click_button('Register')
    fill_in_login
    click_button('Login')
    expect(page).to have_current_path('/feed')
    expect(page).to have_content "Welcome to Chitter, TestyMcTestFace"
    expect(page).to have_content "Peeps!"
    expect(page).to_not have_content "User Login"
  end

  scenario 'Wipes login info if cancel is clicked' do
    visit '/'
    fill_in_login
    click_button('Cancel')
    expect(page).to_not have_content "test@email.com"
    expect(page).to_not have_content "password"
  end
end

feature '#Add Peep' do
  scenario 'Adds a peep' do
    visit '/feed'
    fill_in('add_peep', with: 'Hello World!')
    click_button('Peep!')
    expect(page).to have_content "Hello World!"
  end
end
