require_relative '../spec_helper'

feature 'sign-up' do

  before 'visit homepage' do
    visit('/')
  end

  it 'presence of button to sign-up' do
    expect(page).to have_button('sign-up')
  end

end
