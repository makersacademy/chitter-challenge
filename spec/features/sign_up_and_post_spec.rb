feature 'sign up to chitter' do
  scenario 'user can sign up to chitter to post peep' do
    sign_up
    expect(page).to have_content "Welcome to Chitter Scarface"
  end
end
