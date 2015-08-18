require 'spec_helper'

feature 'Visit home page' do
  scenario 'I have signed in before' do
    user = create(:user)
    sign_in(user)
    visit '/'
    expect(current_path).to eq('/peeps')
  end

  scenario 'I have not signed in previously' do
    visit '/'
    expect(current_path).to eq('/')
  end
end