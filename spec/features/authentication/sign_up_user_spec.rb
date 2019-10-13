feature 'authentication' do
  scenario 'user signs up' do
    sign_up
    expect(current_path).to eq '/home'
    expect(page).to have_content("Thanks for joining Chitter, Guy! Have a really chit time!")
  end

  scenario 'user doesnt include all parameters' do
    visit '/sign_up'
    click_button "Sign Up"
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content("Please fill all the fields!")
  end
end