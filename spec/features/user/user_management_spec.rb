feature 'When signing up' do
  
  scenario 'user can sign up' do
    user = build(:user)
    expect{sign_up(user)}.to change(User, :count).by (1)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(User.first.email).to eq("#{user.email}")
  end
end