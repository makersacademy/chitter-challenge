# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing time of peep' do
  scenario 'A user can see the time of peeps' do
    Peep.create(message: 'message one', user_name: 'user1', timeofpeep: Time.now)
    Peep.create(message: 'message two', user_name: 'user1', timeofpeep: Time.now)
    Peep.create(message: 'message three', user_name: 'user1', timeofpeep: Time.now)

    visit('/peeps')

    expect(page).to have_content "Posted at"
  end
end
