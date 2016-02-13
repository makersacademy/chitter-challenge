
feature 'posting peeps' do

  scenario 'can see the peep on the home page' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'Hello this is my peep'
  end
end
