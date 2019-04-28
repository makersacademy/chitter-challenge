feature 'sign up ' do
  scenario 'sign_up' do
    visit '/'
    fill_in('sign_up_name', with: 'Simon')
    fill_in('sign_up_username', with: 'SY')
    fill_in('sign_up_email', with: 'email@example.com')
    fill_in('sign_up_password', with: 'password123')

    click_button('sign up')
    expect(current_path).to eq "/"

  end

end
