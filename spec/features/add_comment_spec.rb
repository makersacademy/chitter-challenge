feature 'comment on peeps' do
  scenario 'maker can comment on individual peeps' do
    john = Maker.create(username: 'john', email: 'john@john.com', password: 'john1')
    Peep.create(text: 'i am john', time: Time.now, maker: john)
    sign_in
    visit '/peeps/comments/1'
    fill_in 'words', with: ':-)'
    click_button 'comment'
    expect(page).to have_content ':-)'
  end
end
