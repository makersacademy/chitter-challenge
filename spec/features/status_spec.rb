require "pg"

feature "status page" do
  
  scenario "display 'What's on your mind?' on the page" do
    visit("/status")
    expect(page).to have_content("What's on your mind?")
  end

  scenario "It displays 'I am a huge nerd ... and I love it' as status after you submit it as a status" do
    visit "/status"
    fill_in :author, :with => "Nerd."
    fill_in :status, :with => "I am a huge nerd ... and I love it"
    click_on "submit"
    expect(page).to have_content("I am a huge nerd ... and I love it")
  end

  scenario "It displays the time the post was made" do
    visit "/status"
    fill_in :author, :with => "gamefreak"
    fill_in :status, :with => "gotta catch them all!"
    click_on "submit"
    expect(page).to have_content("#{Time.now.hour}:#{Time.now.min}")
  end

end
