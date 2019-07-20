feature 'Adding messages to chitter' do
  scenario 'As a user, I want be able to add messages to Chitter' do
    visit('/')
    fill_in 'peep', with: ("This the content to my peep")
    click_on("Post")
    expect(page).to have_link("This the content to my peep")
  end
end
