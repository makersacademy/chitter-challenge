require 'web_helper'

feature 'Creating Peeps' do
  scenario 'I can create a new peep' do
    create_peep
    expect(current_path).to eq '/peeps'

    within 'ul#peeps'
    expect(page).to have_content ('Random title')
  end

  scenario 'I can see the time the peep was made' do
    create_peep
    expect(current_path).to eq '/peeps'

    within 'ul#peeps'
    expect(page).to have_content("Peep_created_at:")
  end
end
