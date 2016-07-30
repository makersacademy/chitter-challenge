feature 'user can sign up for chitter' do
  scenario 'user signs up' do
    visit '/users'
    fill_in 'email', with: "s.yalniz@hotmail.de"
    fill_in 'password', with: "password123"
    fill_in 'name', with: "Samed Yalniz"
    fill_in 'username', with: "syalniz"
    click_button "Sign up"
    expect(User.count). to eq 1
  end
end
