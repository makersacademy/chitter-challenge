feature 'homepage' do
  scenario 'there are options on the homepage' do
    visit '/'
    expect(page).to have_content("boring homepage")
  end
end

feature 'signing up' do
  scenario 'user can sign up on the homepage' do
    expect { sign_up_correctly }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Chitter, catlover")
  end

  scenario 'user cannot sign up if passwords do not match' do
    expect { sign_up_incorrectly }.not_to change(User, :count)
    expect(current_path).to eq('/user/new')
    expect(page).to have_content("Password does not match the confirmation")
  end
end
