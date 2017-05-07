require './spec/spec_helper'

feature Chitter do
  scenario 'puts Hello world' do
    visit '/'
    expect(page).to have_content "Hello world"
  end
end
