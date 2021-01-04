feature "Chitter Home Page" do
  scenario "has chitter as brand" do
    visit "/"
    expect(page).to have_content "Chitter"
  end

  scenario "has a login link" do
    visit "/"
    find_link("Login").visible?
  end

  scenario "user can click login" do
    visit "/"
    find_link("Login").visible?
    expect(page).to have_link("Login", href: "login")
  end

  scenario "has a sing up link" do
    visit "/"
    find_link("Sign up").visible?
  end

  scenario "user can click sign up" do
    visit "/"
    find_link("Sign up").visible?
    expect(page).to have_link("Sign up", href: "signup")
  end

  scenario "a user can login if registered" do
    login_user
    expect(page).to have_content "Admin"
  end

  scenario "a user can't login unless registered" do
    wrong_user
    expect(page).to have_content "Please check your email or password."
    expect(page).to have_link("I don't have an account yet", href: "/signup")
  end

  scenario "a registed user can publish a new post with a pubishing date" do
    login_user
    fill_in("post", with: "This is a post")
    click_button("Post")
    expect(page).to have_content "This is a post"
    expect(page).to have_content Time.new.strftime("%A, %d/%b/%y at %I:%M %p")
  end

  scenario "all user can see all the posts published as a list without login" do
    visit "/"
    find("ul li").text
  end
end
