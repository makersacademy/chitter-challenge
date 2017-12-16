def send_peep(msg)
  fill_in :message, with: msg
  click_on 'PeepIt'
end
