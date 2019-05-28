feature 'SIGNING UP' do

  scenario 'there is a username field' do
    visit '/'
    expect(page).to have_field('username')
  end

  scenario 'name is displayed on main page' do
    visit '/'
    fill_in('username', :with => 'meee')
    click_button('Enter')
    expect(page).to have_content('meee')
  end

  scenario 'peeps display their author' do
    visit '/'
    fill_in('username', :with => 'meee')
    click_button('Enter')
    fill_in('message', :with => 'ello poppet')
    click_button('send')
    visit '/'
    fill_in('username', :with => 'yoou')
    click_button('Enter')
    fill_in('message', :with => 'ello lavly')
    click_button('send')
    expect(page).to have_content('sent by meee')
    expect(page).to have_content('sent by yoou')
  end

end
