feature 'users' do
  scenario 'sign up to increase user count' do
    expect{ sign_up }.to change{ User.count }.by 1
  end

  scenario 'welcome user on homepage when signed up' do
    sign_up
    expect(page).to have_content 'Welcome JohnDude'
    expect(current_path).to eq '/'
  end

  xscenario 'don\'t allow multiple sign ups for same mail' do

  end

  xscenario 'sign out' do

  end
end
