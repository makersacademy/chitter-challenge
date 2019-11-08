require 'spec_helper' 

feature "post peep" do
  scenario "posts a peep to chitter" do
  visit ('/peeps/new')
  fill_in 'peep', with: 'This is my first peep!'
  fill_in 'user', with: 'Faduma'
  click_button 'post peep'

  expect(current_path).to eq'/peeps'
  expect(page).to have_content('This is my first peep!')
  end
end
