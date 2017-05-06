feature 'Homepage loads successfully' do
  scenario 'Infrastructure working correctly' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'users can sign up and head to the homepage' do
    signs_in_successfully
    expect(page).to have_current_path('/home')
  end

  scenario 'user is greeted upon signing up' do
    signs_in_successfully
    expect(page).to have_content 'Welcome to Chitter, Jack Dorsey'
  end
end
