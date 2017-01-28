# User Story One
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do

  scenario 'leads to peeps page' do
    sign_up_valid_details
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Test User Name!'
  end

  scenario 'signing up increases user count' do
    expect{sign_up_valid_details}.to change{User.count}.by 1
  end

  context 'name' do
    scenario 'can not be empty' do
      expect{sign_up_empty_name}.not_to change(User, :count)
    end
  end

  context 'email address' do
    scenario 'can not be empty' do
      expect{sign_up_empty_email}.not_to change(User, :count)
    end
    scenario 'should be valid' do
      expect{sign_up_invalid_email}.not_to change(User, :count)
    end
    context 'uniqueness' do
      scenario 'can not sign in twice' do
        expect{sign_up_twice}.to change{User.count}.by 1
      end
      scenario 'not unique email throws error' do
        sign_up_twice
        expect(page).to have_content("Email is already taken")
      end
    end
  end

  context 'password' do
    scenario 'can not be empty' do
      expect{sign_up_empty_password}.not_to change(User, :count)
    end
    context 'missmatched' do
      scenario 'does not increase user count' do
        expect{sign_up_wrong_password_confirmation}.not_to change(User, :count)
      end
      scenario 'leaves user on the signup page' do
        sign_up_wrong_password_confirmation
        expect(current_path).to eq '/'
      end
      scenario 'throws an error message' do
        sign_up_wrong_password_confirmation
        expect(page).to have_content "Password does not match the confirmation"
      end
      scenario 'keeps email address in a signup form' do
        sign_up_wrong_password_confirmation
        expect(find_field('email').value).to eq('test@test.com')
      end
    end
  end

end
