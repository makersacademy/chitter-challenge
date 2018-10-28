# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  before do
    create_account
  end

  scenario 'Can enter name, username, email, password, and submit' do
    expect(page).to have_content "Hi Caitlin"
  end

  scenario 'Once signed up a user can view the peeps' do
    click_button "Post peep"
    post_peep
    click_button "View peeps"
    expect(page).to have_content "Hi there"
  end

  scenario 'Once signed up the user can post peeps' do
    click_button "Post peep"
    post_peep
    expect(page).to have_content "Peep posted"
  end

  scenario 'Can only enter a username and email that dont exist yet' do
    create_account
    expect(page).to have_content "Sorry those details have already been registered, please try again"
  end
end
