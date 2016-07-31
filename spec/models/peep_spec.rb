describe Peep do

  let(:leo) do
    User.create(username: 'Leo',
                email: 'leo@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')

  end

  let(:jonny) do
    User.create(username: 'Jonny',
                email: 'jonny@test.com',
                password: 'another_password',
                password_confirmation: 'another_password')

  end

  it 'Saves a peep with a valid user' do
    expect(Peep.count).to eq 0
    Peep.create(peep: "Where did the sun go?", user: jonny)
    expect(Peep.count).to eq 1
  end
  
end

  # User Story 4:
  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  # it 'I can post a peep to Chitter' do
  #   # SHOULD I CHECK WHETHER WE ARE LOGGED IN OR NOT
  #   log_in(email: 'jonny@test.com', password: 'another_password')
  #   visit '/peeps/new'
  #   fill_in "peep", with: "Still need to make my fantasy team"
  #   click_button "Post peep"
  #   expect(page.current_path).to eq '/peeps'
  #   within 'ul#peeps' do
  #     expect(page).to have_content "Still need to make my fantasy team"
  #   end
  # end

# User Story 6
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

#   it 'The time of a peep is displayed' do
#     Peep.create(peep: "Let's check the timestamp", user: leo)
#     visit '/peeps'
#     expect(page).to have_content "Time"
#   end
#
#   # User Story 5
#   # As a maker
#   # So that I can see what others are saying
#   # I want to see all peeps in reverse chronological order
#
#   it 'Sorts peeps in reverse chronological order' do
#
#   end
# end
