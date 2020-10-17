def formatted_date(string)
  Time.strptime(string, '%Y-%m-%d %H:%M:%S.%N%z').strftime('%d-%m-%Y %H:%M')
end