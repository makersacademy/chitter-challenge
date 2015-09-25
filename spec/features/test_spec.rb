require 'spec_helper'

feature 'Test' do

  scenario 'Test' do
    visit '/'
    expect(page).to have_content("Hello Chitter!")
  end

end
