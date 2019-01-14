RSpec.feature 'User Authentication' do
  let (:email){'test@test.com'}
  let(:password){'secret123'}

  context 'Sign in' do


    scenario 'A user can sign in' do
        sign_up(email,password)
        logout_user
        sign_in(email,password)
        expect(page).to have_content('email')
    end

    scenario 'A user cannot sign in with incorrect password' do
        sign_up(email,password)
        logout_user
        sign_in(email,'Gabe')
        expect(page).to have_content('Error')
    end

    scenario 'A user cannot sign in with incorrect email' do
        sign_up(email,password)
        logout_user
        sign_in('WRONGEMAIL', password)
        expect(page).to have_content('Error')
    end
  end
end
