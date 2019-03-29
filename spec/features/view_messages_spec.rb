feature 'View messages' do
  scenario 'user can view messages on a feed'  do
    Message.post(message: "Hi, my name is Riya")
    visit '/chitter_feed'
    expect(page).to have_content "Hi, my name is Riya"
  end
end
