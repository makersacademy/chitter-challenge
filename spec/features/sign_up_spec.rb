feature 'signing up' do
  scenario 'user can sign up on the homepage' do
    expect{ sign_up_correctly}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Chitter, cat@cats.com")
  end

  scenario 'user cannot sign up if passwords do not match' do
    expect { sign_up_incorrectly }.not_to change(User, :count)
    expect(current_path).to eq('/user/new')
    expect(page).to have_content("Passwords do not match")
  end
end
