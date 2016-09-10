require 'spec_helper'
require_relative 'web_helper'

feature 'sign up' do
  before do
      Capybara.reset_session!
    end
  scenario 'user can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page). to have_content "Welcome stf"
    expect(User.first.nickname).to eq('stf')
  end
end
