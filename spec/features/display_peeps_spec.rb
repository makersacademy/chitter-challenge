require_relative './web_helpers.rb'

feature 'display peeps' do
  scenario 'show peeps in reverse order with a time stamp' do
    visit '/'
    expect(page).to have_content(Time.now.strftime("%d-%m-%Y %H:%M"))
  end
end
