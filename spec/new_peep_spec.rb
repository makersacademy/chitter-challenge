feature 'user writes a new peep' do
  before do
    User.create(email: 'bob@gmail.com', password: 's3cr3t', password_confirmation: 's3cr3t')
  end
  scenario 'user writes first peep' do
    visit 'sessions/new'
    fill_in 'email', with: 'bob@gmail.com'
    fill_in 'password', with: 's3cr3t'
    click_button 'Sign in'
    click_button 'New Peep'
    fill_in 'peep', with: 'my first peep'
    click_button 'Peep'
    expect(current_path).to eq '/users/mypeeps'
    expect(page).to have_content 'my first peep'
  end
end
