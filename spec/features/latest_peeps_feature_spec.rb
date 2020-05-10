require 'pg'

feature 'the latest peeps' do
  scenario "lets the user read the latest peeps" do
    visit '/'
    fill_in('new_peep', with: 'Quotation, n: The act of repeating erroneously the words of another.')
    click_button('peep')
    expect(page). to have_text('Quotation, n: The act of repeating erroneously the words of another.',)
    expect(page). to have_text('created:')
  end
end
