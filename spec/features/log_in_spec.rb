# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Client logs in' do
  scenario 'with correct credentials' do
    sign_up
    log_in(email: 'test@email.com', password: 'secret_password')
    expect(page).to have_content 'Welcome, nickname'
  end

  context "I can't log in" do
    context 'without' do
      scenario 'email' do
        sign_up
        log_in(email: nil, password: 'secret_password')
        expect(page).to have_content 'The email or password is incorrect'
      end

      scenario 'password' do
        sign_up
        log_in(email: 'test@email.com', password: nil)
        expect(page).to have_content 'The email or password is incorrect'
      end
    end

    context 'with wrong' do
      scenario 'email address' do
        sign_up
        log_in(email: 'wrong@email.com', password: 'secret_password')
        expect(page).to have_content 'The email or password is incorrect'
      end

      scenario 'email address format' do
        sign_up
        log_in(email: 'test@email', password: 'secret_password')
        expect(page).to have_content 'The email or password is incorrect'
      end

      scenario 'password' do
        sign_up
        log_in(email: 'test@email.com', password: 'wrong_password')
        expect(page).to have_content 'The email or password is incorrect'
      end
    end
  end
end
