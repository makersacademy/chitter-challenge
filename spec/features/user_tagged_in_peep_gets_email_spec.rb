require_relative '../../app/lib/mailer'

feature 'user notified when tagged in a post' do
  let(:peep_1) { 'Hello @AlexB' }
  let(:peep_2) { 'Hello @AlexB and @Jonno' }
  before do
    sign_up
    sign_up(email: 'alex@alex.com', username: 'AlexB', name: 'Alex')
    sign_up(email: 'john@john.com', username: 'Jonno', name: 'John')
    log_in('Dave', '12345')
    allow(Mailer).to receive(:call)
  end
  scenario 'one user tagged' do
    expect(Mailer).to receive(:call).with(User.first(username: 'AlexB'))
    new_peep(peep_1)
  end
  scenario 'two users tagged' do
    expect(Mailer).to receive(:call).with(User.first(username: 'AlexB'))
    expect(Mailer).to receive(:call).with(User.first(username: 'Jonno'))
    new_peep(peep_2)
  end
end
