feature 'Registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_on 'Sign up'
    
    fill_in 'first_name', with: 'Dave'
    fill_in 'last_name', with: 'Dude'
    fill_in 'email', with: 'davedude@example.com'
    fill_in 'user_name', with: 'davedude'
    fill_in 'password', with: 'password123'

    click_on 'Submit'

    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
  end
end
