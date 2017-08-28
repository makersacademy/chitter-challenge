
require './app/models/user'
require_relative 'web_helper'

feature 'log out action' do

  before do
    create_account
    log_in
  end

  scenario 'logs player out' do
    log_out
    expect(current_path).to eq '/login'
  end
end
