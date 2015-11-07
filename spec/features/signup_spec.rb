require 'web_helpers'

feature 'sign up' do
  scenario 'can access the sign up page' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome mmm')
    # expect(User.first.email).to eq('alice@example.com')
  end
end
