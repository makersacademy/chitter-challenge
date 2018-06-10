require "pg"

feature "Post a message" do
  scenario "Can post a message (peep) to Chitter" do
    register_for_chitter
    visit("/peeps/post")
    fill_in("name", with: "Maurice Bendrix")
    fill_in("username", with: "mauribendrix")
    fill_in("message", with: "My very first peep! I live in London!")
    click_button('Post')
    expect(page).to have_content "My very first peep! I live in London!"
    expect(page).to have_content "Maurice Bendrix"
    expect(page).to have_content "mauribendrix"
  end
end
