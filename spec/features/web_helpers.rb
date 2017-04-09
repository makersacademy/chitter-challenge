def create_message_bottle
    visit '/bottle/new'
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'Will anyone ever read this?'
    click_button 'Cork the bottle'
end
