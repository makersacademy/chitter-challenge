feature 'User sign up' do
  scenario 'I can sign up to chitter as me' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path '/users/login'
    expect(User.first.email).to eq "pug@gmail.com"
  end

  scenario "requires a matching confirmation password" do
    expect { password_mismatch }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
