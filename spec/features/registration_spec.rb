feature 'feature.registration' do
  scenario 'register a person to the website' do
    visit('/registration')
    fill_in "name", with: "example"
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "password"
    click_button "Sign up"
    expect(page).to have_content 'Welcome, example'
  end
end
