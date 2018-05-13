feature 'signing up' do
  include Helpers
  scenario 'valid email and password' do
    visit('/')
    new_user('peep.loverl337@booglemail.com',
             'verysecret123',
             'Shrimply Pibbles',
             'shrimplyp')
    expect(page).to have_current_path('/')
  end
end
