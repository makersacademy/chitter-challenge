# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "Post a message (peep) to chitter" do
  scenario "Post a message that can be viewed" do
    visit('/home')
    fill_in 'peep', with: 'So sunny today!'
    click_button('Post Peep')
    visit('/posts')
    expect(page).to have_content 'So sunny today!'
  end
end
