feature 'Homepage loads successfully' do
  scenario 'Infrastructure working correctly' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'users can sign up and head to the homepage' do
    visit '/signup'
    fill_in :email, with: 'example@email.com'
    fill_in :name, with: 'Jack Dorsey'
    fill_in :username, with: 'jack'
    click_button 'Submit'
    expect(page).to have_current_path('/home')
  end
end
