feature 'Signing up to Chitter' do
  scenario 'signing up' do
    visit '/'
    click_button 'Sign Up'

    expect(current_path).to eq '/sign_up'
    fill_in :name, with: 'Tom Eade'
    fill_in :username, with: 'demondeathcharge_tje'
    fill_in :email, with: 'tom@gmail.com'
    fill_in :password, with: 'I<3Chloe'
    click_button 'Create Account'

    expect(current_path).to eq '/account_details'
    expect(page).to have_content 'name: Tom Eade'
    expect(page).to have_content 'username: demondeathcharge_tje'
    expect(page).to have_content 'email: tom@gmail.com'
  end
end
