feature "Posting peep" do

  scenario 'once logged in' do
    user =      User.new(user_name: 'atulord', email: 'a@bc.com',
                password: '1234',
                password_confirmation: '1234')
    user.save
    sign_in('atulord', '1234')
    fill_in :peep_box, with: "Chuka is awesome"
    click_button('Post')
    expect(page).to have_content "Chuka is awesome"
  end

  scenario ' as a reply' do
    user =      User.new(user_name: 'atulord', email: 'a@bc.com',
                password: '1234',
                password_confirmation: '1234')
    user.save
    sign_in('atulord', '1234')
    fill_in :peep_box, with: "Chuka is awesome"
    click_button('Post')
    click_button 'reply'
    fill_in :reply_box, with: 'Yes he is'
    click_button('Reply')
    expect(page).to have_content "Yes he is"
  end
end
