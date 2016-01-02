# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do

  scenario 'New users can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('foobar@example.com')
  end
  context 'if information is inputed incorrectly' do
    scenario 'no matching confirmation password to not add to database' do
      expect { bad_confirmation_sign_up }.not_to change(User, :count)
      expect(current_path).to eq('/signup')
      expect(page).to have_content "Password and confirmation password don't match"
    end
  end

end
