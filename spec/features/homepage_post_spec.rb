
feature 'Post message' do
  scenario "fill in box with message and post it on page" do
    visit('/homepage')
    fill_in"what's on your mind?", with: "I'm cleaning my house"
    click_on('post')
    expect(page).to have_content("I'm cleaning my house")
  end

end
