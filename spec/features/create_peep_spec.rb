feature 'create peep post' do
  let(:user_info) { { 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  scenario 'submit create peep form' do
    visit('/')
    sign_up(user_info)
    fill_in('peep', with: 'I am a peep.')
    click_button('peep')

    expect(page).to have_content('I am a peep.')
  end
end
