feature "Post messages to Chitter" do
  xscenario "Write message, submit and see" do 
    visit('/peeps')
    click_link 'Add new Peep'
    fill_in :new_peep, with: 'I had a dream about regex last night'
    click_button 'Submit'
    expect(page).to have_content 'I had a dream about regex last night'
  end
end 