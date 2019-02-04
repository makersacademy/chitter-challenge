require_relative 'web_helpers'

feature 'sending emails to tagged users' do
  before(:each) do
    Mail::TestMailer.deliveries.clear
  end
  scenario 'a tagged peep is made' do
    sign_up
    click_on 'Log out'
    sign_up(email: 'test@email.com', username: 'newusername')
    make_a_peep("hello @tomd")
    expect(Mail::TestMailer.deliveries.first.to).to eq ['tomdamant@hotmail.com']
  end
end
