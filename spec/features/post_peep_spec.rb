# USER STORY
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting Peeps' do


  scenario 'I can post a single peep' do
  post_a_peep(test_peep_one)
  expect(page).to have_content test_peep_one
  end
end
