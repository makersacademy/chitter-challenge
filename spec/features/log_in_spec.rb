feature 'User Log In' do

  let!(:user) do
    User.create(first_name: 'Tony',
                last_name: 'Stark',
                email: 'tony.stark@starkindustries.com',
                password: 'jarvis',
                password_confirmation: 'jarvis',
                user_name: 'TDawg')
    end

  scenario 'with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Hola, #{user.first_name}"
  end
end
