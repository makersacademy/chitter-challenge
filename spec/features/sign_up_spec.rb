# ./spec/sign_up_spec.rb

feature 'Users management' do
  scenario 'it allows sign up' do
    visit('/signup')
    fill_in("new_user", with: 'tom2022')
    click_button "Sign up!"
    save_and_open_page
    expect(page).to have_content 'Hi, tom2022! You have successfully signed up!'
  end
end
