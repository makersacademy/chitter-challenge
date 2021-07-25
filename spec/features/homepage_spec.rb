feature 'homepage' do
  context 'user not logged in' do
    scenario 'hompage has link to peeps, log-in and sign-up but not new peep or logout' do
      visit('/')

      expect(page).to have_link('View peeps', href: '/peeps')
      expect(page).to have_link('Log in', href: '/users/login')
      expect(page).to have_link('Sign up', href: '/users/new')
      expect(page).not_to have_link('Create new peep', href: '/peeps/new')
      expect(page).not_to have_button('Log out')
    end
  end

  context 'user is logged in' do
    scenario 'hompage has link to peeps and log-out but not sign up' do
      sign_up

      expect(page).to have_link('View peeps', href: '/peeps')
      expect(page).to have_link('Create new peep', href: '/peeps/new')
      expect(page).to have_button('Log out')
      expect(page).not_to have_link('Log in', href: '/users/login')
      expect(page).not_to have_link('Sign up', href: '/users/new')
    end
  end
end
