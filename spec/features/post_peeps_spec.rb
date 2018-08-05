# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'A user can post peeps' do
    visit '/'
    fill_in('peep', with: "Here is a test peep")
    fill_in('username', with: "whatapalaver")
    click_button('add_peep')
    expect(page).to have_content("Here is a test peep")
  end
end
