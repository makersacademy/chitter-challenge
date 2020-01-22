feature 'Login' do
  scenario 'A user logs into chitter with correct email and password' do
      User.create(email: 'example@example.com',password: 'example123',
      name: 'Example Surname', username: 'exampleusername')
      visit '/sessions/new'
      fill_in('email', with: 'example@example.com')
      fill_in('password', with: 'example123')
      click_button('Sign In')

      expect(page).to have_content "Welcome, Example Surname"
    end

    scenario 'A user logs into chitter with incorrect email' do
        User.create(email: 'example@example.com',password: 'example123',
        name: 'Example Surname', username: 'exampleusername')
        visit '/sessions/new'
        fill_in('email', with: 'notcorrect@example.com')
        fill_in('password', with: 'example123')
        click_button('Sign In')

        expect(page).not_to have_content "Welcome, Example Surname"
        expect(page).to have_content "Incorrect email or password"
      end

    scenario 'A user logs into chitter with incorrect password' do
        User.create(email: 'example@example.com',password: 'example123',
        name: 'Example Surname', username: 'exampleusername')
        visit '/sessions/new'
        fill_in('email', with: 'example@example.com')
        fill_in('password', with: 'example')
        click_button('Sign In')

        expect(page).not_to have_content "Welcome, Example Surname"
        expect(page).to have_content "Incorrect email or password"
      end
end
