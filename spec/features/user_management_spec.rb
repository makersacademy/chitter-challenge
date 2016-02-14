feature 'User Sign Up' do
  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Soz mate, that password ain\'t right!'
  end

  def sign_up(       email: 'bobb@fett.com',
                  password: 'betterthanjango',
     password_confirmation: 'betterthanjango')
     visit ('/users/new')
     fill_in :username, with: 'Buoyant Bobba'
     fill_in :name, with: 'Bobba Fett'
     fill_in :email_address, with: email
     fill_in :password, with: password
     fill_in :password_confirmation, with: password_confirmation
     click_button('Save')
  end
end
