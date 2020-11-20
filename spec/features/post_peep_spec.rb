feature 'Post a message to chitter' do
  scenario 'post a peep' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
