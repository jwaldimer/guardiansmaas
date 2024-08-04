# Create shifts for all services based on his contracts
current_week = Time.now.strftime('%-V').to_i

Service.all.each_with_index do |service, index|
  contract = service.contract
  weekdays = (contract.weekdays_start...contract.weekdays_end)
  weekend = (contract.weekend_start...contract.weekend_end)
  weeks = Week.where(number: (current_week..52).to_a)

  weeks.each do |week|
    # Set shifts based on contracts
    (1..7).each do |day|
      contract_hours = day <= 5 ? weekdays : weekend

      contract_hours.each do |hour|
        date = Date.commercial(week.year, week.number, day)
        date_formated = I18n.l(date, format: '%A %d de %B', locale: :es).capitalize
      
        Shift.create(
          service: service,
          week: week,
          start: hour,
          end: hour + 1,
          date: date_formated
        )
      end
    end
  end
end
