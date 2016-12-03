feature "Signing up" do
  scenario "Signing up for Chitter increases the user count by 1" do
    visit('/sign_up')
    fill_in 'name', :with => "Samuel"
    fill_in 'email', :with => "samuel@gmail.com"
    fill_in 'username', :with => "sam123"
    fill_in 'password', :with => "password"
    expect{sign_up}.to change{User.count}.by 1
  end
end
