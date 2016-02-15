
feature 'Responding to a peep' do

  scenario 'with a successful response' do

    double_sign_up_with_peep
    fill_in :reply, with: 'Nice point'
    click_button('Post Reply')
    expect(page).to have_content('Nice point')
    expect(page).to have_content('From Steve (steve)')
    expect(page).to have_content(Time.now.strftime("%d %B %Y, at %H:%M"))

  end

end
