feature 'has a form that allows the user to submit a message' do
  scenario 'user submits message and sees message appear on next page' do 
    visit('/')
    fill_in(:peep, with: "this is the first message ever posted to chitter")
    click_button('Submit')
    expect(page).to have_content('this is the first message ever posted to chitter')
  end
end
