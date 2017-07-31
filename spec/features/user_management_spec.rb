feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bobsmith')
    expect(User.first.username).to eq('bobsmith')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'cannot post a peep if no user logged in' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'View Peep'
    expect(current_path).to eq '/peeps'
    fill_in 'peeps', with: 'Hello World!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).not_to have_content 'Hello World!'
    end
  end
end
