require_relative 'helpers'

feature 'Maker can see Chitter page' do
  scenario 'Maker is welcomed by their name' do
    visit '/'
    log_in
    expect(page).to have_content 'Welcome ola123'
  end
end

