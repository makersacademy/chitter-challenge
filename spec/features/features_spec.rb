# feature_spec.rb

require_relative '../setup_test_database'
require_relative 'web_helpers'

feature 'User has to sign up before being able to post' do
  scenario 'before signing up the user cannot post' do
    visit('/')
    expect(page).to have_button('Sign up')
    click_button('Sign up')
    fill_in('name', with: 'Dave')
    fill_in('email', with: 'dave@dave.com')
    fill_in('password', with: 'pw123')
    fill_in('username', with: 'dave123')
    click_button('Sign up')
    expect(page).to have_button('Peep')
  end

  scenario 'after signing up the username is displayed' do
    sign_up
    expect(page).to have_content('dave123')
  end

  scenario 'after signing up the user can post' do
    sign_up
    expect(page).to have_button('Peep')
  end

  context 'given username is already taken' do
    scenario 'flash message is displayed to alert user' do
      sign_up
      click_button('Log out')
      sign_up_with_another_unique_email
      expect(page).to have_content('Error: username already taken!')
    end
  end

  context 'given email is already taken' do
    scenario 'flash message is displayed to alert user' do
      sign_up
      click_button('Log out')
      sign_up_with_another_unique_username
      expect(page).to have_content('Error: email already taken!')
    end
  end

end

feature 'User can post a peep to Chitter' do
  scenario 'and see the peep on the homepage' do
    sign_up
    fill_in('peep', with: 'This is a test peep')
    click_button('Peep')
    expect(page).to have_content('This is a test peep')
  end

  scenario 'and see the username and name of peeper' do
    sign_up
    fill_in('peep', with: 'This is a test')
    click_button('Peep')
    expect(page).to have_content 'Dave (@dave123) peeped:'
  end

  scenario 'even if they are a returning user' do
    sign_up
    click_button('Log out')
    log_in
    fill_in('peep', with: 'This is a test')
    click_button('Peep')
    expect(page).to have_content 'Dave (@dave123) peeped:'
  end
end

feature 'User can see peeps on Chitter' do
  scenario 'in reverse chronological order' do
    sign_up
    str1 = 'This is a test peep'
    str2 = 'This is another test peep'
    fill_in('peep', with: str1)
    click_button('Peep')
    fill_in('peep', with: str2)
    click_button('Peep')
    expect(page.body.index(str2)).to be < page.body.index(str1)
  end

  scenario 'and also see the time when the peep was posted' do
    sign_up
    fill_in('peep', with: 'test')
    click_button('Peep')
    formatted_time = Time.now.strftime('%I:%M%p on %m/%d/%Y')
    expect(page).to have_content("#{formatted_time}")
  end
end

feature 'Users can logout' do
  context 'given a user has already signed up' do
    scenario 'they can logout' do
      sign_up
      expect(page).to have_button('Log out')
      click_button('Log out')
      expect(page).not_to have_button('Peep')
    end
  end
end

feature 'Users can login' do
  context 'given a user has signed up and logged out' do
    scenario 'they can log in' do
      sign_up
      click_button('Log out')
      click_button('Log in')
      fill_in('email', with: 'dave@dave.com')
      fill_in('password', with: 'pw123')
      click_button('Log in')
      expect(page).to have_button('Peep')
      expect(page).to have_content('dave123')
    end
  end

  context 'given invalid/non-existent login info' do
    scenario 'a flash message is raised' do
      visit '/'
      click_button('Log in')
      fill_in('email', with: 'dave@dave.com')
      fill_in('password', with: 'pw123')
      click_button('Log in')
      expect(page).to have_content('Error: invalid email and/or password')
    end
  end
end
