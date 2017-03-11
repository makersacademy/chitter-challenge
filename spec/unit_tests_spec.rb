feature "Registers the user /" do

  scenario " name field is available" do
    visit "/"
    expect(page).to have_field("name")
  end

  scenario " username field is available" do
    visit "/"
    expect(page).to have_field("username")
  end

  scenario " password field is available" do
    visit "/"
    expect(page).to have_field("password")
  end

  scenario " e-mail field is available" do
    visit "/"
    expect(page).to have_field("email")
  end

  scenario " Submit button is available" do
    visit "/"
    expect(page).to have_button("Submit")
  end

end
