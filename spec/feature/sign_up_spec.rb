feature 'resgister' do
  scenario 'If user is not register yet' do
    visit '/register'
    fill_in 'name', with: 'name'
    fill_in 'user_email', with: 'user_email'
    fill_in 'password', with: 'password'
    click_on 'Submit'
    expect(current_path).to eql('/')
  end
end
