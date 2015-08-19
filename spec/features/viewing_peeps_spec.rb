require 'orderly'

feature 'Viewing peeps:' do

  scenario 'once I have created a peep, I can view it' do
    user = create(:user)
    log_in(user)
    user.peeps.create(peep_body: 'test peep', peep_time: Time.new)
    visit '/peeps/view'
    expect(page).to have_content('test peep')
  end

  scenario 'peeps are in reverse chronological order' do
    user = create(:user)
    log_in(user)
    peep1 = user.peeps.create(peep_body: 'test peep1', peep_time: Time.new)
    peep2 = user.peeps.create(peep_body: 'test peep2', peep_time: Time.new)
    peep3 = user.peeps.create(peep_body: 'test peep3', peep_time: Time.new)
    visit '/peeps/view'
    expect(peep3.peep_body).to appear_before(peep2.peep_body)
    expect(peep2.peep_body).to appear_before(peep1.peep_body)
  end
end
