feature "Viewing Posts" do
  scenario "User able to see all posts on Chitter" do
    Peep.create(peep: "Hi Chitter!")

    visit("/peeps")

    expect(page).to have_content "Hi Chitter!"
    expect(page).to have_button "New Peep"
    expect(page).to have_button "Sign Up"
    expect(page).to have_button "Sign In"
  end
end
