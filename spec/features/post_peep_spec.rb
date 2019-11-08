feature 'post peep' do
  scenario 'post a peep to chitter'
  visit ('/peeps/new')
  fill_in 'peep', with: 'This is my first peep!'
  fill_in 'user', with: 'Faduma'
  click_button 'post peep'

  expect(current_path).to eq'/peeps'
  expect(page).to have_content('This is my first peep!')
end 
