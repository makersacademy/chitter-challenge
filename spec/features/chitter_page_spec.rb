feature "Chitter page" do 
  scenario "Visit the chitter home page" do 
    visit("/")
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario "User creates first post" do
    User.create("Test", "test@test.com", "test123")
    log_in
    fill_in("text", with: "My first post")
    click_button "Send"
    expect(page).to have_content "My first post"
  end

  scenario "User want to see the oldest posts first" do
    user = User.create("Test", "test@test.com", "test123")
    post_1 = Chitter.create("First post", user.id, user.name) 
    post_2 = Chitter.create("Second post", user.id, user.name)
    visit("/")
    select "Old First", :from => "Display"
    click_button "Ok"
    expect(page).to have_css('table', text: "Author Created At Test First post #{post_1[0]["created_at"][0..18]} Test Second post #{post_2[0]["created_at"][0..18]}")
  end

  scenario "Each post has aouthor name visible" do 
    User.create("Test", "test@test.com", "test123")
    log_in
    fill_in("text", with: "My first post with name")
    click_button "Send"
    expect(page).to have_content "Author Created At Test My first post with name"
  end

end