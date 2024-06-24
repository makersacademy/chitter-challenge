require 'pg'

feature 'Viewing Chitter' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'visiting all post page' do
    visit('/posts')
    expect(page).to have_content "All posts"
  end

  scenario 'visiting sign up page' do
    visit('/user')
    expect(page).to have_content "SIGN UP"
  end

  scenario 'visiting login page' do
    visit('/log_in')
    expect(page).to have_content "Login"
  end

end

feature 'Adding and viewing posts' do
    feature 'a user can add and then view a post' do
      scenario 'a post is added to a chitter' do
        user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
  
        visit '/'
        click_button 'Login'
        fill_in 'username', with: 'username1234'
        fill_in 'password', with: '123457jghjhgj'
        click_button 'Submit'
        expect(page).to have_button "Display my posts"

        click_button 'Display my posts'
        expect(page).to have_content "Your posts"

        click_button 'Add new post'
        expect(current_path).to eq "/user/#{user.id}/posts/new"
  
        fill_in 'text', with: 'This is a test message'
        click_button 'Submit'
  
        expect(current_path).to eq '/posts/'
        expect(page).to have_content 'This is a test message'

        click_button 'Homepage'
        expect(current_path).to eq '/'

        click_button 'Display all posts'
        expect(page).to have_content 'This is a test message'
      end
    end
  end

  feature 'Adding and viewing posts' do
    feature 'a new user sign up, add and then view a post' do
      scenario 'a post is added to a chitter' do
        visit '/'
        click_button 'Sign Up'
        fill_in 'username', with: 'username12345'
        fill_in 'password', with: '123457jghjhgj'
        fill_in 'password_confirmation', with: '123457jghjhgj'
        click_button 'Submit'
        expect(page).to have_button "Display my posts"

        click_button 'Display my posts'
        expect(page).to have_content "Your posts"

        click_button 'Add new post'
        fill_in 'text', with: 'This is a test message 2'
        click_button 'Submit'
  
        expect(current_path).to eq '/posts/'
        expect(page).to have_content 'This is a test message 2'

        click_button 'Homepage'
        expect(current_path).to eq '/'
        click_button 'Display all posts'
        expect(page).to have_content 'This is a test message 2'
      end
    end
  end

  feature 'Updating and deleting posts' do
    feature 'a user can edit and then delete a post' do
      scenario 'a post is deleted from a chitter' do
        user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
  
        visit '/'
        click_button 'Login'
        fill_in 'username', with: 'username1234'
        fill_in 'password', with: '123457jghjhgj'
        click_button 'Submit'
        expect(page).to have_button "Display my posts"

        click_button 'Display my posts'
        expect(page).to have_content "Your posts"

        click_button 'Add new post'
        expect(current_path).to eq "/user/#{user.id}/posts/new"
  
        fill_in 'text', with: 'This is a test message'
        click_button 'Submit'
  
        expect(current_path).to eq '/posts/'
        expect(page).to have_content 'This is a test message'

        click_button 'Homepage'
        expect(current_path).to eq '/'

        click_button 'Display all posts'
        expect(page).to have_content 'This is a test message'

        click_button 'Homepage'
        expect(current_path).to eq '/'
        click_button 'Display my posts'
        first('.post').click_button 'Edit'
        fill_in 'text', with: 'This is a edited test message'
        click_button 'Submit'
        expect(page).to have_content 'This is a edited test message'
        visit('/posts')
        expect(page).to have_content 'This is a edited test message'
        
        visit('/posts/')
        first('.post').click_button 'Delete'
        expect(page).not_to have_content 'This is a edited test message'
        visit('/posts')
        expect(page).not_to have_content 'This is a edited test message'
 
        click_button 'Homepage'
        click_button 'Logout'
        expect(page).to have_button "Sign Up"
      end
    end
  end
