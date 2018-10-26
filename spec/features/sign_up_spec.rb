# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  before do
    visit '/'
    fill_in "name", with: "Caitlin"
    fill_in "username", with: "Caitlincooling"
    fill_in "email", with: "Caitlin@test.com"
    fill_in "password", with: "caitlin123"
    click_button "Sign up"
  end

  scenario 'Can enter name, username, email, password, and submit' do
    expect(page).to have_content "Hi Caitlin"
  end

  scenario 'Once signed in a user can view the peeps' do
    click_button "Post peep"
    fill_in 'peep', with: "Hi there"
    click_button "Peep"
    click_button "View peeps"
    expect(page).to have_content "Hi there"
  end

  scenario 'Once signed in the user can post peeps' do
    click_button "Post peep"
    fill_in 'peep', with: "Hi there"
    click_button "Peep"
    expect(page).to have_content "Peep posted"
  end

  scenario 'Can only enter a user name that doesnt exist yet' do
    visit '/'
    fill_in "name", with: "Cait"
    fill_in "username", with: "Caitlincooling"
    fill_in "email", with: "Caitlin@test.com"
    fill_in "password", with: "cait123"
    click_button "Sign up"
    expect(page).to have_content "Sorry those details have already been registered, please try again"
  end
end
