feature 'Posting a message' do
  scenario 'A user wants to add a message to chitter' do
    visit ('/post_message')
    expect(page).to have_content ("Chitter Message")
    expect(page).to have_content ("New peep")
    expect(page).to have_content ("Welcome to Chitter!")

  end
end
