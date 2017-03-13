feature "User sign up" do
  scenario "users can sign up to chitter with their details" do
    visit '/'
    fill_in 'username', with: 'JoB123'
    fill_in 'name', with: 'Jo Bloggs'
    fill_in 'email', with: "jobloggs@test.com"
    fill_in 'password', with: "P455w0rd"
    click_button 'register'
    expect(page).to have_content("Thank you for registering to chitter")
  end
end
