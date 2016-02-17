feature 'Viewing peeps' do

  scenario 'I can see peeps on the home page' do
    Peep.create(name: 'My Name', username: 'My Username', text: 'Testing')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Testing')
    end
  end
end

feature 'Creating peeps' do
  scenario 'I can create a peep' do
    visit '/peeps'
    click_button('New Peep')
    fill_in :name, with: 'My Name'
    fill_in :username, with: 'My Username'
    fill_in :text, with: 'Testing Again'
    fill_in :time, with: 'Now'
    click_button('Post Peep')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Testing Again')
    end
  end
end

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, barry@example.com')
    expect(User.first.email).to eq('barry@example.com')
  end
end

feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'barry@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
