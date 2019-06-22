require_relative '../helpers/add_users_peeps'

# As a Maker
# So that I can see my peep history
# I want to see all my peeps on my user page

feature 'user peep history' do
  scenario 'user page has peeps' do

    create_users_peeps
    visit('/')
    click_button('View All Users')
    click_link('JD')
    expect(page).to have_content('This is my first peep')
  end
end