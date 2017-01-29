feature 'User Sign Up' do

  scenario 'user can sign up to the app' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'cannot sign up if already registered' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'cannot sign up if email is blank' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'cannot sign up if email is not in the correct format' do
    expect { sign_up(email: "test@") }.not_to change(User, :count)
  end

 scenario 'requests user to confirm password upon sign up' do
   expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
   expect(current_path).to eq '/users'
   expect(page).to have_content 'Password does not match the confirmation'
   expect(find_field('email').value).to eq ('test@test.com')
 end

end
