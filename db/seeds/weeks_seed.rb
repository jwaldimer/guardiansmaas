# Create weeks for current year
year = Time.now.year

(1..52).each do |week_number|
  Week.create(number: week_number, year: year)
end
