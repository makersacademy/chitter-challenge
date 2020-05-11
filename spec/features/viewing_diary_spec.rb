feature 'Viewing Homepage' do
  scenario 'adding dieary_test text' do
    visit '/'
    fill_in 'title', with: 'FIRST BEST DAY!'
    fill_in 'msg', with: 'Dear Diary, i opened up my feelings firstly today, so exiceted!.' 
    click_button 'add'
    expect(page).to have_content 'FIRST BEST DAY!'
    expect(page).to have_content 'Dear Diary, i opened up my feelings firstly today, so exiceted!.'
  end
end

