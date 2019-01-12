RSpec.feature 'Header Navigation' do
  let (:email){'test@test.com'}
  let(:password){'secret123'}

  context 'user arrives on site top navigation offers sign up /sign in not signed in' do


    scenario 'A user can see sign in' do
        visit '/'
        expect(page).to have_selector(:css, 'a[href="/signin"]')
    end

    # scenario 'A user cannot sign in with incorrect password' do
    #     sign_up(email,password)
    #     logout_user
    #     sign_in(email,'Jethro')
    #     expect(page).to have_content('Error')
    # end

    # scenario 'A user cannot sign in with incorrect email' do
    #     sign_up(email,password)
    #     logout_user
    #     sign_in('WRONGEMAIL', password)
    #     expect(page).to have_content('Error')
    # end
  end
end
