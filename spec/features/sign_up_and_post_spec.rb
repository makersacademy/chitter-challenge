feature 'sign up to chitter' do
  scenario 'user can sign up to chitter to post peep' do
    visit '/'
    fill_in :name, with: "Harry Potter"
    fill_in :user_name, with: "Scarface"
    fill_in :email, with: "hpotter@gmail.com"
    fill_in :password, with: "Password123"
    click_button 'Sign up'
    expect(page).to have_content "Welcome to Chitter, Scarface"
  end
end
