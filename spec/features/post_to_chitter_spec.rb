# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'so that users can let people know what they are doing' do
  include Helpers
  scenario 'a user wants to post a peep to chitter' do
    visit '/'
    sign_up
    first_peep
    visit '/homepage'
    expect(page).to have_content "First peep!"
  end
end
