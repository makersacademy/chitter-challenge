# User Story 1
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep to Chitter' do
  scenario 'user can write a peep and post it' do
    sign_up
    post_peep
    expect(page).to have_content "This peep is very profound"
  end

  scenario 'a peep cannot be more than 140 characters long' do
    sign_up
    post_long_peep
    expect(page).to have_content("That's too long, be more concise!")
  end
end
