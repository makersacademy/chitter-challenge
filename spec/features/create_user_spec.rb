feature "users can be created" do
  scenario "user has fills out fields correctly" do
    visit "/"
    click_link "new user"
    expect(current_path).to eq "/user/new"
    fill_in :full_name, with: "Donald J. Trump"
    fill_in :user_name, with: "realDonaldTrump"
    fill_in :email, with: "scumlord@potus.com"
    fill_in :password, with: "the best passwords"
    fill_in :password_confirmation, with: "the best passwords"
    click_button "sign_up"
    expect(current_path).to eq "/"
    expect(page).to have_content "@realDonaldTrump"
    expect(User.first.full_name).to eq "Donald J. Trump"
    expect(User.first.user_name).to eq "@realDonaldTrump"
    expect(User.first.email).to     eq "scumlord@potus.com"
  end
end
