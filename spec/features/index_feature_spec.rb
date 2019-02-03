feature 'index' do
  scenario "expect simple index page" do
    visit("/")
    expect(page).to have_content('Welcome to Chitter')
    click_button("Sign up")
    expect(page).to have_content('Create your account')
  end
end
