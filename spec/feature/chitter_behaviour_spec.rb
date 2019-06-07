feature "Chitter main page" do
  scenario "it displays messages" do
    visit("/")
    expect(page).to have_content("Chitter away!")
  end

  scenario "it has a button that allows users to add new messages" do
    visit("/")
    click_button("Add new Peep")
    expect(page).to have_content("What is on your mind?")
  end

  scenario "it displays messages in reverse chronological order" do
    post_a_peep
    click_button("Add new Peep")
    fill_in "peep", with: "Tomorrow will be great too!"
    click_button("Peep")
    # arrest that Tomorrow is before Today
    expect(page).to have_text(/Tomorrow .+ Today/)
  end

  scenario "show the time at which the peep was posted" do
    post_a_peep
    expect(page).to have_content("Posted @")
  end
end

feature "Add new peep page" do
  scenario "it takes a content and posts it on ChitterChatter borad" do
    post_a_peep
    expect(page).to have_content("Today is the best day!")
  end
end

feature "Add users" do
  scenario "user registration" do
    visit("/user")
    fill_in("user", with: "user@me.com")
    fill_in("pass", with: "pass123")
    fill_in("name", with: "Rocky")
    click_button("Sign Me Up")
    expect(page).to have_content "Hello, Rocky"
  end
end
