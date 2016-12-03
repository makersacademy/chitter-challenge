require './app/app.rb'

feature "Signing up" do
  scenario "Should allow user to create a Chitter account" do
    visit '/'
    fill_in('username', with: 'louisaspicer')
    fill_in('email', with: 'louisa@example.com')
    fill_in('password', with: 'greatpassword')
    fill_in('confirm_password', with: 'greatpassword')
    click_button('Submit')

    expect(page).to have_content 'Welcome louisaspicer!'
  end
end
