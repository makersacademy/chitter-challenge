
feature 'Add peep' do
  scenario 'Visit add_peep page and update index with new peep' do
  visit('/post_peep')
  fill_in 'context', with: 'My first peep'
  click_on 'Post peep!'
  expect(page).to have_content 'My first peep'
  end
end
