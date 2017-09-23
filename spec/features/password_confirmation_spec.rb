
feature 'When visiting the signup page' do
  scenario 'I can  see a signup form, enters the wrong password and no user is created' do
    sign_up_wrong_password
    # expect { sign_up }.to change(User, :count).by(1)
    expect(User.map(&:email_address)).to eq []
    expect(current_path).to eq('/signup_to_peep')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
