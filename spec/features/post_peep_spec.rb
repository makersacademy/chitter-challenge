feature "posting peeps" do
  scenario "user should be able to post a peep" do
    visit_page_and_sign_up
    fill_in("content", with: "I'm Kim!")
    click_button("Peep")
    expect(page).to have_content("I'm Kim!")
    expect(page).to have_content("@kim-morgan")
  end
end