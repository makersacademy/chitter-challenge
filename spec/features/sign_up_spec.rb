feature "Sign up" do
  scenario "Create new user" do
    visit 'user/new'
    fill_in :name, with: "Dan MacCarthy"
    fill_in :user_name, with: "Dannylou"
    fill_in :email, with: "danMac@email.com"
    fill_in :password, with: "s£c3£t"
    click_button "Sign up"
    expect{click_button "Sign up"}.to change(User, :count).by 1
  end
end
