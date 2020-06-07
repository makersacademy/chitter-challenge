require_relative 'helpers'

feature 'Maker can see Chitter login page' do
  scenario 'Maker is welcomed by their username' do
    visit '/'
    log_in
    expect(page).to have_content 'Welcome ola123'
  end
end

