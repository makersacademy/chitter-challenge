
feature 'signing up' do
	scenario 'I can sign up' do
		sign_up
		expect(page).to have_content 'Welcome, Bob'
	end


  scenario 'new user signs up and user count increases by 1' do
    sign_up
    expect(User.count).to eq 1
  end

  scenario 'requires a matching confirmation password' do
   expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
   expect(current_path).to eq('/sign_up')
   expect(page).to have_content('Password does not match the confirmation')
  end

	scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/sign_up')
    expect(page).to have_content('Email must not be blank')
  end

	scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/sign_up')
    expect(page).to have_content('Email has an invalid format')
  end

 scenario 'I cannot sign up with an existing email' do
   sign_up
   expect { sign_up }.to_not change(User, :count)
   expect(page).to have_content('Email is already taken')
 end

	scenario 'I cannot sign up with an existing username' do
   sign_up
   expect { sign_up }.to_not change(User, :count)
   expect(page).to have_content('Username is already taken')
 end
end
