feature 'Sign up' do
  scenario 'user can go to registration page' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq '/users/new'
  end

  scenario 'user can fill out registration form' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome, Anne")
  end

  scenario 'user gets saved in database' do
    expect { sign_up }.to change{ User.count}
  end

  
end
