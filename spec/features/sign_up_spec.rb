feature 'A user can register' do
  scenario 'new users details are saved to the database' do
    visit '/'
    click_button "Sign Up"
    fill_in "name", with: "Joey Tribbiani"
    fill_in "email", with: "joey@babykangaroo.com"
    fill_in "password", with: "friends"
    click_button "Submit"
    expect(page).to have_content("Hey Joey Tribbiani!")
  end
end
