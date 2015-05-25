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

  scenario 'and sees their peep on the front page' do
    sign_in
    post_peep
    visit '/'
    expect(page).to have_content('This is a test peep')
  end
end

feature 'User views list of peeps' do

  before(:each) do
    user = User.create(email: 'uhoh@danieljohnston.co.uk',
                       handle: 'hrrmm',
                       password: 'testpassword',
                       password_confirmation: 'testpassword')
    @fake_time = []
    @fake_time[0] = Time.now - 500
    4.times do |index|
      @fake_time << @fake_time[index] + 100
    end

    user.peeps.create(content: 'First peep', time: @fake_time[0])
    user.peeps.create(content: 'Second peep', time: @fake_time[1])
    user.peeps.create(content: 'Third peep', time: @fake_time[2])
    user.peeps.create(content: 'Fourth peep', time: @fake_time[3])
    user.peeps.create(content: 'Fifth peep', time: @fake_time[4])
  end

  scenario 'and sees them in reverse chronological order' do
    visit '/'
    expect(page).to have_content(/Fifth\p{Zs}peep[\s\S]*
                                  Fourth\p{Zs}peep[\s\S]*
                                  Third\p{Zs}peep[\s\S]*
                                  Second\p{Zs}peep[\s\S]*
                                  First\p{Zs}peep/x)
  end

  scenario 'and sees the time each was posted at' do
    visit '/'
    expect(page).to have_content('Fifth peep - ' + @fake_time[4].to_s)
  end

end
