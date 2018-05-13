require_relative './web_helper'

feature 'creating peeps' do
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }

  before do
    visit('/')
    new_user(email, password, name, username)
    log_in(username, password)
  end

  xscenario 'user logged in' do
    new_peep('My first peep')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep')
    expect(page).to have_text(name, count: 2)
    expect(page).to have_text("@#{username}", count: 2)
  end

  scenario 'date/time is shown' do
    allow(Time).to receive(:now).and_return("2018-05-12 13:49:06")
    new_peep('My first peep')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text(Time.now)
  end
end
