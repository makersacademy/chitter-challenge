feature 'Posting poops' do

  scenario 'I can post a new poop' do
    visit '/poops/new'
    fill_in 'poop',   with: "My first ever poop on sh*tter!"
    click_button 'Post Poop'

    expect(current_path).to eq '/poops'

    within 'ul#poops' do
      expect(page).to have_content("My first ever poop on sh*tter!")
    end
  end
end
