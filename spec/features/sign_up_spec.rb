feature 'user signup' do

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario 'with a blank email field' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with invalid email address' do
    expect { sign_up(email: 'user(.tye')}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'sign up with existing email address' do
    sign_up
    expect { sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
