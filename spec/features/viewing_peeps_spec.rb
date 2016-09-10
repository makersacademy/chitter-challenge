require 'spec_helper'

feature 'viewing peeps' do

  let!(:user) do
    User.create(name: 'Santa', username: 'santaclaus',
                email: 'santa@northpole.com',
                password: 'christmas', password_confirmation: 'christmas')
  end

  # scenario 'users can see peeps in reverse chronological order even when not logged in' do
  #   visit '/'
  #   # expect(page.find('li:nth-child(1)')).to have_content('Ho ho ho!')
  #   # expect(page.find('li:nth-child(2)')).to have_content('Counting down until Christmas!')
  #   # expect(page.body.index('Ho ho ho!')).to be < page.body.index('Counting down until Christmas!')
  # end
  #
  # scenario 'users can view peep time stamps' do
  #   visit '/'
  #   Peep.create(message: 'Counting down until Christmas!' , time_created: Time.new, user: user)
  #   Peep.create(message: 'Ho ho ho!' , time_created: Time.new,  user: user)
  #   within 'ul#messages' do
  #     expect(page).to have_content Time.new.strftime("%e %b %k:%M")
  #   end
  # end

end
