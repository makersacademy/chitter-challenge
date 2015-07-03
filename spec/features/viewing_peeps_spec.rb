require './app/models/peep'

feature 'Viewing messages' do

  scenario 'I can view existing messages on the page' do
    Peep.create(message: "test peep", time: Time.new)

    visit '/peeps'

    expect(page.status_code).to eq 200

    expect(page).to have_content('test peep')
  end
end
