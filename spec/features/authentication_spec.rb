feature 'Logging in' do
  scenario 'user logs in with the right email and password' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345'
    )

    log_in(email: 'happy@auth.com', password: '12345')
    
    expect(current_path).to eq('/')
    expect(page).to have_content('Successfully logged in as happyauth')
    expect(page).not_to have_button('Log in')
    expect(page).not_to have_button('Sign up')
  end
  feature 'user visits bad paths' do
    before { sign_up(username: 'happyauth', email: 'happy@auth.com') }

    scenario 'user logs in and goes to user/login' do      
      visit('/user/login')

      expect(page).to have_content("Already logged in as happyauth")
      expect(current_path).to eq('/')
    end

    scenario 'user logs in and goes to user/new' do
      visit('/user/new')

      expect(page).to have_content("Please log out first")
      expect(current_path).to eq('/')
    end

    feature 'user enters wrong details' do
      before { click_button 'Log out' }

      scenario 'user enters an invalid email' do    
        log_in(email: 'wrongemail@auth.com', password: '12345')
        
        expect(current_path).to eq('/user/login')
        expect(page).to have_content("An account with that email doesn't exist")
      end
    
      scenario 'user enters the right email but wrong password' do    
        log_in(email: 'happy@auth.com', password: 'thewrongpassword')
        
        expect(current_path).to eq('/user/login')
        expect(page).to have_content("Please check your password is correct")
      end
    end
  end
end

feature 'logging out:' do
  scenario 'user logs out' do
    sign_up(username: 'happyauth', email: 'happy@auth.com')
    
    click_button 'Log out'

    expect(page).to have_content('You have logged out')
    expect(page).to have_button('Log in')
    expect(page).to have_button('Sign up')
    expect(page).not_to have_button('Log out')
    expect(page).not_to have_content('Log out')
  end
  
  scenario 'user cannot log out if they are not logged in' do
    visit('/user/logout')

    expect(page).to have_content("You are not logged in")
    expect(current_path).to eq('/user/login')
  end
end
