# As a Maker
# So that I can let people know what I am doing  
# # I want to post a message (peep) to chitter
feature 'posting messages' do
  scenario 'A user can post messsages on chitter' do
    visit('/')
    expect(page).to have_content "This is my new message"
  end
end