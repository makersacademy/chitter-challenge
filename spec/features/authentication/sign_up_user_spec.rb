feature 'authentication' do
  scenario 'user signs up' do
    visit '/'
    click_link 'Sign Up'
    fill_in "Chitter Handle", with: "the_queen"
    fill_in "Name", with: "The Queen"
    fill_in "Password", with: "AReallyReallySecurePassword"
    click_button "Sign Up"
    expect(current_path).to eq '/home'
    expect(page).to have_content("Thanks for joining Chitter, The Queen! Have a really chit time!")
  end
end