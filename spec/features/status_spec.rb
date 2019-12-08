require "pg"

feature "status page" do
  
  scenario "display 'What's on your mind?' on the page" do
    visit("/status")
    expect(page).to have_content("What's on your mind?")
  end

  scenario "It puts displays 'I am a huge nerd ... and I love it' as status after you submit it as a status" do
    visit "/status"
    fill_in :author, :with => "Nerd."
    fill_in :status, :with => "I am a huge nerd ... and I love it"
    click_on "submit"
    expect(page).to have_content("I am a huge nerd ... and I love it")
   end

end
