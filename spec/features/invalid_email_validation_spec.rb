feature 'Invalid email confirmation' do
  scenario 'invalid email raises error' do

    sign_up(email: 'crap')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter a valid email address')

  end
end
