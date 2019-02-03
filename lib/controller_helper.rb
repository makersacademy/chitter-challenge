# keeping controllers slim
def condition(email, password, user)
  redirect '/start' if email == ""
  redirect '/start' if password == ""
  redirect '/start' if user == ""
end
