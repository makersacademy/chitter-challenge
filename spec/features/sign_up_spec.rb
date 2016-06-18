
feature 'User can sign up' do
  scenario 'User signs up' do
    visit '/sign_up'
    fill_in 'name', with: 'John'
    fill_in 'username', with: 'John_Doe'
    fill_in 'email', with: 'john_doe@mail.com'
    fill_in 'password', with: 'secret'
    click_button 'Create my Account'
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Welcome John!'
  end
end
