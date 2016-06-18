describe "Replying to peeps" do
  let!(:user) { create_user }
  let!(:another_user) do
    User.create(
      username: USERS.last[:username],
      name: USERS.last[:name],
      email: USERS.last[:email],
      password: "password123",
      password_confirm: "password123"
    )
  end

  let!(:latest_peep) do
    Peep.create(
      text: "Two",
      timestamp: Time.new(2001, 01, 01),
      user: another_user
    )
  end

  let!(:oldest_peep) do
    Peep.create(
      text: "One",
      timestamp: Time.new(2000, 01, 01),
      user: user
    )
  end

  scenario "reply link does not appear when not logged in" do
    visit("/peeps")
    expect(page).to_not have_content("Reply")
  end

  scenario "reply link only appears on another user's peep" do
    log_in
    visit("/peeps")
    within find("#timeline li:first-child") do
      expect(page).to have_content("Reply")
    end

    within find("#timeline li:nth-child(2)") do
      expect(page).to_not have_content("Reply")
    end
  end

  scenario "a logged in user can reply to another user's peep" do
    log_in
    visit("/peeps")
    within find("#timeline li:first-child") do
      click_link(:Reply)
    end

    expect(current_path).to eq("/peeps/new")
    expect(find_field(:text).value).to eq("@#{ another_user.username }")
  end
end
