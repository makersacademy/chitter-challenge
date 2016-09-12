require 'spec_helper'

feature 'user can sign up' do
  scenario 'I can sign up as a new user' do
    expect { signup }.to change(User, :count).by 1
    expect(User.first.email).to eq('erce@erce.com')
  end
end
