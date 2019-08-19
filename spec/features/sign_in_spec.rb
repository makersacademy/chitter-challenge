require 'pg'
require 'spec_helper'

feature 'authentication:' do
    scenario 'a user can sign in' do
        User.create(email: 'test@example.com', password: 'password123')
        visit '/sessions/new'
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
    
        expect(page).to have_content 'Welcome to Chitter test@example.com'
    end

    scenario 'raises and error if user enters wrong email' do
        User.create(email: 'test@example.com', password: 'password123')
    
        visit('/sessions/new')
        fill_in(:email, with: 'test@examp.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
    
        expect(page).not_to have_content 'Welcome, test@example.com'
        expect(page).to have_content 'Please check your email or password.'
      end

      scenario 'raises and error if user enters wrong password' do
        User.create(email: 'test@example.com', password: 'password123')
    
        visit('/sessions/new')
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'password1')
        click_button('Sign in')
 
        expect(page).not_to have_content 'Welcome, test@example.com'
        expect(page).to have_content 'Please check your email or password.'
      end

      scenario 'a user can sign out' do
        User.create(email: 'test@example.com', password: 'password123')

        visit '/sessions/new'
        fill_in(:email, with: 'test@example.com')
        fill_in(:password, with: 'password123')
        click_button('Sign in')
        
     
        click_button('Sign out')
  
        expect(page).not_to have_content 'Welcome to Chitter test@example.com'
        expect(page).to have_content 'You have signed out.'
      end
  end
  