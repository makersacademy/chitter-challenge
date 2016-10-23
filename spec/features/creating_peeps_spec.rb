require_relative '../web_helper'

feature 'User posts a new message' do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }
  let!(:user) do
    User.create(email: email, password: password)
  end

  scenario 'I can post a message to chitter' do
    sign_in(email: email, password: password)
    body = 'Message 1'
    post_peep(body: body)
    expect(page).to have_content(body)
  end

  scenario 'I can see when my peep was posted' do
    sign_in(email: email, password: password)
    body = 'Message 1'
    time = Time.new.strftime("%b %-d %H:%M")
    post_peep(body: body)
    expect(page).to have_content(time)
  end

  scenario 'I can see a list with my peeps' do
    sign_in(email: email, password: password)
    body1 = 'Message 1'
    post_peep(body: body1)
    body2 = 'Message 2'
    post_peep(body: body2)
    expect(page).to have_content(body1)
    expect(page).to have_content(body2)
  end
end
