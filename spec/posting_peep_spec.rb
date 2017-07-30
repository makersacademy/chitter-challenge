
feature 'posting peeps' do
  scenario 'I can add new peeps' do
    visit '/peeps/new'
    fill_in :peep, with: "Hello, my first peep"
    click_button 'submit'
    expect(page).to have_content("Hello, my first peep")
    end
  end
