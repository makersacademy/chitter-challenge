feature 'Post peep' do
  scenario 'A user can post a message' do
  visit('/peeps')

expect(page).to have_content "I am posting a message to Chitter"
end
end
