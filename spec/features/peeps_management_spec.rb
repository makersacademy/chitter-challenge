require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peeps'

include SessionHelpers
include PeepsHelpers

feature 'User posts a peep' do

  before(:each) do
    User.create(email: 'uhoh@danieljohnston.co.uk',
                handle: 'hrrmm',
                password: 'testpassword',
                password_confirmation: 'testpassword')
  end

  scenario 'and receives confirmation of posting' do
    sign_in
    post_peep
    expect(page).to have_content('Your peep has been posted')
  end

  scenario 'while not logged in' do
    expect{ post_peep }.to raise_error('Unable to find field :content')
    expect(page).to have_content('You need to be logged in first')
  end

  xscenario 'and sees their peep on the front page' do

  end

end
