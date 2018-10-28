# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post a Peep' do
  scenario 'a user can post a peep' do
    register_user
    create_single_peep
    expect(page).to have_content("peeper1234\nWoohoo, I am peeping")
  end
end
