feature 'authentication' do
  scenario 'user signs up' do
    sign_up
    expect(current_path).to eq '/home'
    expect(page).to have_content("Thanks for joining Chitter, The Queen! Have a really chit time!")
  end
end