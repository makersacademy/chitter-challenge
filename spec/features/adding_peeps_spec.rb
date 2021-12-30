# require 'pg'

# feature 'Creating peeps' do
#   scenario 'A user can create a peep' do
#     visit('/users/new')
#     fill_in('email', with: 'pepe@mail.com')
#     fill_in('password', with: 'password123')
#     click_button('Register')
#     click_link('New Peep!')
#     expect(page).to have_field('text')
#     fill_in('text', with: 'My first peep!')
#     click_button('Submit')
#     expect(page).to have_content('My first peep!')
#     expect(page).to have_current_path('/users')
#     expect(page).to have_content('My first peep!')
#   end
# end

require 'pg'
feature 'Creating peeps' do
  scenario 'A user can create a peep' do
    visit('/peeps/new')
    fill_in('text', with: 'My first peep!')
    click_button('Submit')
    expect(page).to have_content('My first peep!')
  end
end