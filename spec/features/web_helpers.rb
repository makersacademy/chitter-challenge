def create_message_bottle
    visit '/bottle/new'
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'Will anyone ever read this?'
    click_button 'Cork the bottle'
end

def create_another_message_bottle
    visit '/bottle/new'
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'I read it!'
    click_button 'Cork the bottle'
end
def create_third_message_bottle
    visit '/bottle/new'
    expect(page.status_code).to eq 200
    fill_in 'message', with: 'So did I!'
    click_button 'Cork the bottle'
end
