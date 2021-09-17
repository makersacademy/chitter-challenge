feature 'Posting to Chitter' do
  scenario 'User can post a message to chitter' do
    visit ('/')
    expect(page).to have_content "My chitter message"
  end
end

