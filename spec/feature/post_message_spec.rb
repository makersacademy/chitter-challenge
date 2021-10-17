feature "Post messages to Chitter" do
  scenario "Write message, submit and see" do 
    visit('/peeps')
    click_button 'Add new Peep'
    visit('/peeps/new')
    fill_in :new_peep, with: 'I had a dream about regex last night'
    click_button 'Submit'
    expect(page).to have_content 'I had a dream about regex last night'
  end
end 