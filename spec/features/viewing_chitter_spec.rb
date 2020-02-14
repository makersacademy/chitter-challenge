feature 'see the homepage' do
  scenario 'A user can see the homepage' do
    visit('/')
    expect(page).to have_content "This is my homepage"
  end
end
# As a Maker
# So that I can let people know what I am doing  
# # I want to post a message (peep) to chitter
feature 'posting messages' do
  scenario 'A user can post messsages on chitter' do
    visit('/messages')
    fill_in("peep", with: "Test post message")
    click_button("Submit")

    expect(page).to have_content "Test post message"
  end
end