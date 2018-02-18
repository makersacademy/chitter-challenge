feature "first post" do
  scenario "user enters his first post" do
    sign_in_and_peep
    expect(page).to have_content "Enter your peep and share it with the world!"
  end
end
