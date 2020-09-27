feature "user can sign up" do
  scenario "user signs up for chitter with a username, name, email and password" do
    visit "/"
    click_button "Sign Up"
    fill_in :username, with: "Catzkorn"
    fill_in :email, with: "ilikecats@ireallylikecats.cat"
    fill_in :name, with: "Charlotte Brandhorst-Satzkorn"
    fill_in :password, with: "donthackmeplease"
    click_button "Sign Up"
    expect { page }.not_to raise_error
  end
end
