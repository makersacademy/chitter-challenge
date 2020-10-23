feature 'adding a peep' do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:peep_text) { 'example peep' }
  
  scenario 'user cannot post unless signed up' do
    visit '/chitter'
    expect(page).not_to have_button 'PEEP!'
  end

  scenario 'user signs up and posts a peep' do
    visit '/chitter'
    sign_up(name: user, username: username, email: email, password: password)
    fill_in 'peep', with: peep_text
    click_button 'PEEP!'
    expect(current_path).to eq '/chitter'
    first_peep = find('.peep', match: :first)
    expect(first_peep).to have_content peep_text
    expect(first_peep).to have_content username
  end
end
