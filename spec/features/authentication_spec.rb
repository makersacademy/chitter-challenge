feature 'authentication' do
    it 'a user can sign in' do
        User.create(name: 'JP', email: 'test@example.com', password: 'password123')
    
        visit '/sessions/new'
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
    
        expect(page).to have_content 'Welcome, JP'
    end
end

feature 'authentication' do
    scenario 'a user sees an error if they get their email wrong' do
        User.create(name: 'John', email: 'test@example.com', password: 'password123')
    
        visit '/sessions/new'
        fill_in(:email, with: 'nottherightemail@me.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
    
        expect(page).not_to have_content 'Welcome, John'
        expect(page).to have_content 'Please check your email or password.'
    end
end

feature 'authentication' do
    scenario 'a user sees an error if they get their password wrong' do
        User.create(name: 'James', email: 'test@example.com', password: 'password123')
    
        visit '/sessions/new'
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'wrongpassword')
        click_button('Sign in')
    
        expect(page).not_to have_content 'Welcome, James'
        expect(page).to have_content 'Please check your email or password.'
    end
end

feature 'authentication' do
    scenario 'a user can sign out' do
        User.create(name: 'Tom', email: 'test@example.com', password: 'password123')
    
        visit '/sessions/new'
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
    
        click_button('Sign out')
    
        expect(page).not_to have_content 'Welcome, Tom'
        expect(page).to have_content 'You have signed out.'
    end
end