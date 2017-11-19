feature 'User sign up' do
  scenario 'User signs up as a Chitteroo member' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hey thatdania!')
    expect(User.first.email).to eq('thatdania@gmail.com')
  end
end
