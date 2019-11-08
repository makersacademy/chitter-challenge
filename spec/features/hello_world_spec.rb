feature 'it can call my website' do
  scenario 'I can call the index page' do
    visit '/'
    # fill_in "username" => "CarpeDM"
    # fill_in "password" => "abcde"
    # click_button 'Login'
    expect(page).to have_content "Welcome to Chitter"
  end
end