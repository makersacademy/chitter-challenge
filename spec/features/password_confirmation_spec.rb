# rubocop:disable all
feature 'When visiting the signup page' do
  scenario 'See a signup form, enter wrong password, no user created' do
    pw_mismatch = 'Password and confirmation password do not match'

    sign_up_wrong_password
    # expect { sign_up }.to change(User, :count).by(1)
    expect(User.map(&:email_address)).to eq []
    expect(current_path).to eq('/signup_to_peep')
    expect(page).to have_content pw_mismatch
  end
end
