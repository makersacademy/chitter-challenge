feature "posting peeps" do
  scenario "user should be able to post a peep" do
    visit_page_and_sign_up
    fill_in("content", with: "My first peep!")
    click_button("Peep")
    expect(page).to have_content("My first peep!")
    expect(page).to have_content("Posted by kim-morgan")
  end
end