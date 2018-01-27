# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'peeps' do
#   scenario 'user can view a peep on chitter' do
#     Peep.create(peep: 'My first peep')
#     visit '/'
#     expect(page).to have_content("My first peep")
#   end

  scenario 'user can post a peep on chitter' do
    visit '/'
    fill_in :new_peep, with: "My first peep"
    click_button 'peep!'
    expect(page).to have_content("My first peep")
    # expect(page).to have_content("pm")
  end
end
