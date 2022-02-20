feature "reply to a peep" do
  scenario "click reply and show reply text box" do
    user = create_test_user
    peep = Peep.create(peep: "Peep to reply to", user_id: user.id, parent_peep_id: '')
    sign_in(email: user.email, password: "password123")
    click_link("reply")

    expect(page).to have_content("Peep your reply")
  end

  scenario "a user posts a reply to Chitter" do
    user = create_test_user
    peep = Peep.create(peep: "Peep to reply to", user_id: user.id, parent_peep_id: '')
    sign_in(email: user.email, password: "password123")
    click_link("reply")
    fill_in('peep', with: 'I have replied')
    click_button('Post Reply')
    expect(page).to have_content("I have replied")
  end

  scenario "Cannot reply to a peep if not logged on" do
    visit '/'
    expect(page).not_to have_link("reply")
  end

  scenario "Cannot reply to a peep if going directly to reply route and not logged in" do
    visit '/reply'
    expect(page).to have_button("Log on")
  end

  scenario "Cannot reply to a peep if going directly to reply route with a peep that does not exist and logged in" do
    user = create_test_user
    sign_in(email: user.email, password: "password123")
    visit '/reply?peep_id=20'
    expect(page).to have_content("Welcome")
  end

end
