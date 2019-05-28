feature 'PEEPS DISPLAY A TIMESTAMP' do

  scenario 'view the timestamp' do
    visit '/'
    click_button('Enter')
    fill_in('message', :with => 'Iya luuuv')
    click_button('send')
    expect(page).to have_content(Peep.all.first.time_sent)
  end

end
