
feature 'chitter' do
  before(:each) do
    Peep.destroy
    User.destroy
    create_users
    create_peeps
  end

  # Capybara.default_driver = :selenium
  # Capybara.server = :webrick

  feature 'registering an account' do
    scenario 'user can register an account then login' do
      visit '/'
      click_link('Register an account')
      fill_in('username', with: 'BirdsRule')
      fill_in('password', with: 'securepassword1')
      click_button('Sign up')
      login('BirdsRule', 'securepassword1')
      expect(page).to have_css('.text', text: 'First ever peep!!!!')
    end
  end

  feature 'logging in' do

    scenario 'user is redirected to the peeps page if already logged in' do
      login
      visit '/'
      expect(page).to have_css('.text', text: 'First ever peep!!!!')
    end

    scenario 'correct username and password takes user to the peeps page' do
      visit '/'
      fill_in('username', with: 'Peter')
      fill_in('password', with: '12345')
      click_button('Login')
      expect(page).to have_css('.text', text: 'First ever peep!!!!')
    end
    scenario 'incorrect username shows an error' do
      visit '/'
      fill_in('username', with: 'asdf')
      fill_in('password', with: 'asdf')
      click_button('Login')
      expect(page).to have_css('.error', text: 'Error: invalid username')
    end
    scenario 'incorrect password shows an error' do
      visit '/'
      fill_in('username', with: 'Peter')
      fill_in('password', with: 'asdf')
      click_button('Login')
      expect(page).to have_css('.error', text: 'Error: invalid password')
    end
  end

  feature 'logging out' do
    scenario 'logging out takes user to the login page' do
      login
      click_button('Logout')
      expect(page).to have_field('username')
      expect(page).to have_field('password')
    end
    scenario 'trying to view peeps after logging out shows an error' do
      login
      click_button('Logout')
      visit '/peeps'
      expect(page).to have_css('.error', text: 'Error: not logged in')
    end
    scenario 'trying to post peeps after logging out shows an error' do
      login
      click_button('Logout')
      visit '/post'
      expect(page).to have_css('.error', text: 'Error: not logged in')
    end
  end

  feature 'viewing peeps' do 
    feature 'user is not authenticated' do
      scenario 'user is redirected to login with an error' do
        visit '/peeps'
        expect(page).to have_css('.error', text: 'Error: not logged in')
      end
    end
  
    feature 'user is authenticated' do
      scenario 'peep is present on the page' do
        login
        expect(page).to have_css('.text', text: 'First ever peep!!!!')
      end

      scenario 'peeps are in chronological order' do
        login
        within all('.peep').last do
          expect(page).to have_css('.text', text: 'First ever peep!!!!')
        end
      end

      scenario 'peep times are displayed' do
        now = Time.now
        Peep.create(text: "Hello", created_at: now, user_id: User.first({username: 'Peter'}).id)
        date_time = now.strftime("#{now.day.ordinalize} of %B, %Y at %l:%M%P")
        login
        within first('.peep') do
          expect(page).to have_css('.datetime', text:date_time)
          expect(page).to have_css('.text', text:"Hello")
        end
      end

      scenario 'peep user is displayed' do
        login
        within all('.peep').last do
          expect(page).to have_css('.username', text: 'Peter')
        end
      end
    end
  end

  feature 'peeping (posting peeps)' do
    feature 'user is not authenticated' do
      scenario 'user is redirected to login with an error' do
        visit '/post'
        expect(page).to have_css('.error', text: 'Error: not logged in')
      end
    end

    feature 'user is authenticated' do
      scenario 'user can click the post button and be taken to the post page' do
        login
        click_link('Post a peep')
        expect(page).to have_field('text')
        expect(page).to have_button('Submit')
      end

      scenario 'user can peep and see their peep at the top of the index page' do
        login
        click_link('Post a peep')
        fill_in('text', with: 'I can peep too!')
        click_button('Submit')
        within first('.peep') do
          expect(page).to have_css('.text', text: 'I can peep too!')
        end
      end
    end
  end
end