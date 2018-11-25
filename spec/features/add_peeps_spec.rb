
feature 'Add peep' do
  scenario 'Visit add_peep page and update index with new peep' do
  visit('/add_peep')
  fill_in 'content', with: 'My first peep'
  click_on 'submit'
  expect(page).to include 'My first peep'
  end
end
