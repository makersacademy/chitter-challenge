feature "reply to a peep" do
  scenario "click reply and show reply text box" do
    user = create_test_user
    peep = Peep.create(peep: "Peep to reply to", user_id: user.id)
    sign_in(email: user.email, password: "password123")
    click_link("reply")

    expect(page).to have_content("Peep your reply")
  end
end
