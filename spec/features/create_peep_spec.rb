# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature "posting a message" do
  scenario "a user posts a message to Chitter" do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello World')
    click_button('Post Peep')

    expect(page).to have_content("Hello World")

  end
end
