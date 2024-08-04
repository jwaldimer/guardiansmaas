# Create weeks for current year
year = Time.now.year


Week.destroy_all

(1..52).each do |week_number|
  Week.create(number: week_number, year: year)
end
