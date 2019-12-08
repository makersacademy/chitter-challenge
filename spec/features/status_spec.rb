require "pg"

feature "status page" do
  
  scenario "display 'What's on your mind?' on the page" do
    visit("/status")
    expect(page).to have_content("What's on your mind?")
  end

end
