feature 'Post a message to Chitter' do
  scenario 'post and view test peep' do
    sign_up
    click_button('Sign out')
    sign_in
    post_peep(peep: 'Stampy the cat is more than awesome!')
    expect(page).to have_content('Stampy the cat is more than awesome')
  end
end