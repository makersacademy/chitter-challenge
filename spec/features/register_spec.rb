feature 'register' do
  include SessionHelpers

  let(:name) { 'Camilla' }

  scenario 'receiving a welcome message' do
    expect { register(name: name) }.to change(User, :count)
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome #{name}"
  end

  scenario 'can\'t happen as the passwords don\'t match' do
    register(password_confirmation: 'wrongpass')
    expect(current_path).to eq '/register'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'can\'t happen if username or email are already taken' do
    2.times { register }
    expect(current_path).to eq '/register'
    expect(page).to have_content "Username is already taken Email is already taken"
  end
end
