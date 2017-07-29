feature 'Signing up' do
  scenario 'As a new user I can sign up for Chitter' do
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to Chitter, George"
  end
end
