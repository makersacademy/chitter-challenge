require_relative 'web_helper'

RSpec.feature 'Login' do
  scenario 'User can login' do
    log_in
    expect(page.current_path).to eq('/profile')
  end
end
