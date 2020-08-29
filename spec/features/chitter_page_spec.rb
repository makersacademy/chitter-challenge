feature "Chitter page" do 
  scenario "Visit the chitter home page" do 
    visit("/chitter")
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario "User creates first post" do 
    visit("/chitter")
    fill_in("text", with: "My first post")
    click_button "Send"
    expect(page).to have_content "My first post"
  end

  scenario "User want to see the oldest posts first" do
    Chitter.create("First post") 
    Chitter.create("Second post")
    visit("/chitter")
    select "Old First", :from => "Display"
    click_button "Ok"
    expect(page).to have_content "First post\nSecond post"
  end
end