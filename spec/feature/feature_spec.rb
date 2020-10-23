require_relative '../database_helpers.rb'

feature 'the site has a homepage' do
  scenario 'the user visits the homepage' do
    visit('/')
    expect(page).to have_content("chitter")
  end
end

feature 'users can peep' do
  scenario "the site's homepage has a form that asks people to peep" do
    visit('/')
    expect(page).to have_field("what's up?")
  end

  scenario "the user writes a peep" do
    visit('/')
    click_on('sign in')
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'pword123')
    click_on('sign in')
    fill_in('text', with: "This is a test peep")
    click_on('peep it!')
    expect(page).to have_content("This is a test peep")
  end
end

feature 'users can sign up' do
  scenario 'a user signs up' do
    visit('/')
    sign_up
    expect(page).to have_content('You are now signed up and in')
  end
end

feature 'users can sign in & out' do
  scenario 'a user signs in' do
    truncates
    test_user
    visit('/')
    click_on('sign in')
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'pword123')
    click_on('sign in')
    expect(page).to have_content 'chitter'
  end

  scenario 'a user tries to sign in with the wrong details' do
    truncates
    user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')

    visit('/')
    click_on('sign in')
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'wrong-password')
    click_on('sign in')
    expect(page).to have_content 'Invalid details'
  end

  scenario 'a user signs out' do
    truncates
    user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')

    visit('/')
    click_on('sign in')
    fill_in('username', with: 'test_username')
    fill_in('password', with: 'pword123')
    click_on('sign in')
    click_on('sign out')
    expect(page).to have_content "You have been signed out."
  end

end


