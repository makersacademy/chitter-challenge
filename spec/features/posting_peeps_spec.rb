feature 'as a user' do
  scenario 'i can post a cheet' do
    visit '/'
    fill_in('cheet', with: "My first cheet")
    click_button 'Submit'
    expect(page).to have_content "My first cheet"
  end
  scenario 'I cannot post more than 200 chars' do
    visit '/'
    fill_in('cheet', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qua")
    click_button 'Submit'
    expect(page).to have_content "ERROR: value too long for type character"
  end
end
