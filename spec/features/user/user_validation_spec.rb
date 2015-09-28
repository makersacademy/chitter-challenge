feature 'Data validation' do

  context 'when signing up' do
    
    context 'the email address' do
      
      scenario 'must be unique' do
        sign_up(build(:user))
        sign_up(build(:user))
        expect(page).to have_content "Email is already taken"
      end

      scenario 'must be in valid email format' do
        sign_up(build(:user, email: "bleh"))
        expect(page).to have_content 'Email has an invalid format'
      end
    end

    context 'the password provided' do

      scenario 'must match the confirmation password' do
        sign_up(build(:user, password: 'bla'))
        expect(page).to have_content 'Password does not match the confirmation'
      end

      scenario 'must not be blank' do
        sign_up(build(:user, password: nil, password_confirmation: nil))
        expect(page).to have_content 'Password must not be blank'
      end

      scenario 'must be at least 8 characters in length' do
        sign_up(build(:user, password: "bleh", password_confirmation: "bleh"))
        expect(page).to have_content 'Password must be at least 8 characters long'
      end
    end

    context 'the password provided' do

      scenario 'must enter a unique username' do
        sign_up(build(:user))
        sign_up(build(:user))
        expect(page).to have_content 'Username is already taken'
      end

      scenario 'that is larger than eight chars in length' do
        sign_up(build(:user, username: "blah"))
        expect(page).to have_content 'Username must be at least 8 characters long'
      end
    end
  end
end