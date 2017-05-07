feature "User can Sign Out" do\
  before(:each) do
    User.create(name: "Bertie", email: "Test.email@test.com", username: "BertZ", password: "Password1234", password_confirmation: "Password1234")
  end
  scenario "while signed in, Signs out" do
    sign_in(username: "BertZ", password: "Password1234")
    click_button 'Sign Out'
    expect(page).to have_content("Thank you for visiting Chitter")
    expect(page).not_to have_content("Welcome to Chitter BertZ")
  end
end
