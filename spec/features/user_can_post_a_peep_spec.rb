feature 'User can post a peep' do
    let!(:user) do
      User.create(name: 'Ana Maria Suciu',
                  username: 'ana',
                  email: 'ana@great.com',
                  password: 'apples')
                  visit '/sessions/new'
                  fill_in :email, with: 'ana@great.com'
                  fill_in :password, with: 'apples'
                  click_button 'Log In'
    end

    scenario 'user creates a peep post' do
      expect(current_path).to eq '/peeps'
      click_button 'Peep!'
      fill_in 'peep', with: 'Working on my weekend challenge'
      click_button 'Peep!'
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Working on my weekend challenge'
    end

  end
