feature "Go to the website and it exist" do
  scenario "Homepage exists" do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature "Post a message ('peep') on page" do
  scenario "Post a 'peep'" do
    visit('/peeps')
    expect(page).to have_content "This is my first peep!"
  end
end
