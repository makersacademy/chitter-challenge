feature 'signing up to chitter' do
  before do
    visit '/'
    click_button 'Sign up'
  end

  scenario 'should fields for email, password, name, and username' do
    expect(page).to have_css("input[type='text'][placeholder='albob@gmail.com']")
    expect(page).to have_css("input[type='text'][placeholder='password']")
    expect(page).to have_css("input[type='text'][placeholder='Alice Bobson']")
    expect(page).to have_css("input[type='text'][placeholder='albob123']")
  end

  scenario 'submitting should show peeps page with user-specific greeting' do
    fill_in :email, with: 'albob@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :name, with: 'Alice Bobson'
    fill_in :username, with: 'albob123'
    click_button 'Submit'
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content 'Hello albob123'
  end
end
