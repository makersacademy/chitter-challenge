feature 'sign_up' do
  scenario 'user signs up on first visit' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('John Doe')
    expect(User.first.email).to eq('john.doe@gmail.com')
  end
end
