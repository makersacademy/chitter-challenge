feature 'able to take in username' do

  scenario 'it prints the input name' do
    visit '/'
    fill_in 'username', with: 'limcuili'
    click_button 'Go!'
    expect(page).to have_content 'Hello, limcuili!'
  end

end
