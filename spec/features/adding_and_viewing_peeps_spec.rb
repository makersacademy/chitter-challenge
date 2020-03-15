feature 'adding and viewing peeps' do

  feature 'a user can add and then view a peep' do
    scenario 'a user adds a peep' do
      User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

      # Then sign in as them:
      visit '/sessions/new'
      fill_in :email, with: 'test@example.com'
      fill_in :password, with: 'password123'
      click_button 'Log in'

      visit '/peeps'
      fill_in 'peep', with: 'The news is depressing'
      click_button 'Peep'

      # This will post to '/peeps/new', create the peep instance then redirect to /peeps

      expect(current_path).to eq '/peeps'
      expect(first('.peep')).to have_content 'The news is depressing'
    end

  end
end
