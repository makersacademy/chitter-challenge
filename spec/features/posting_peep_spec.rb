feature 'Posting a peep on Chitter' do
  before do
    sign_up(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')
    log_in(email: 'pug@email.com', password: 'password')
  end
  
  scenario 'I can post a new peep on Chitter' do
    post_a_peep('Morning everyone!')
    expect(page).to have_content 'Peep: Morning everyone!'
  end
end
