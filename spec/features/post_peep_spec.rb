# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'peeps' do

  scenario 'user can post a peep on chitter' do
    visit '/peeps/new'
    fill_in :new_peep, with: "My first peep"
    click_button 'peep!'
    expect(page).to have_content("My first peep")
  end
end
