require 'spec_helper'

feature 'viewing peeps' do

  let!(:user) do
    User.create(name: 'Santa', username: 'santaclaus',
                email: 'santa@northpole.com',
                password: 'christmas', password_confirmation: 'christmas')
  end

  let!(:peep) do
    Peep.create(message: 'Counting down until Christmas!', time_created: Time.new, user: user)
  end

  before do
    sign_in('santaclaus', 'christmas')
    add_peep('Ho ho ho!')
    sign_out
  end

  scenario 'users can see peeps in reverse chronological order even when not logged in' do
    visit '/'
    expect('Counting down until Christmas!').to appear_before('Ho ho ho!')
  end

  scenario 'users can view peep time stamps' do
    visit '/'
    expect(page).to have_content(peep.time_created.strftime("%k:%M %e %b"))
  end

end
