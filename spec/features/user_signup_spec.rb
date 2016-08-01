feature 'managing user accounts' do

  scenario 'a new user can sign-up' do

    expect{ sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome Ben.'

  end

  scenario 'passwords must match' do

    expect { sign_up(confirm: 'cba321') }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Password does not match the confirmation'

  end

   scenario 'a user cannot sign up with an existing email' do

     sign_up
     sign_out
     expect{ sign_up }.to_not change(User, :count)
     expect(page).to have_content 'Email is already taken'

   end

   scenario 'I cannot sign up without an email address' do

     expect { sign_up(email: nil) }.not_to change(User, :count)
     expect(current_path).to eq('/user')
     expect(page).to have_content('Email must not be blank')

   end

end
