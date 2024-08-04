contracts = [
  { weekdays_start: 19, weekdays_end: 24, weekend_start: 10, weekend_end: 24, start_at: '2024-08-29', end_at: '2025-12-31' },
  { weekdays_start: 8, weekdays_end: 14, weekend_start: 10, weekend_end: 24, start_at: '2024-08-29', end_at: '2025-12-31' },
  { weekdays_start: 14, weekdays_end: 19, weekend_start: 10, weekend_end: 24, start_at: '2024-08-29', end_at: '2025-12-31' }
]

Contract.destroy_all

# Create contracts for services
Service.all.each_with_index do |service, index|
  data = OpenStruct.new(contracts[index])
  service.create_contract(
    weekdays_start: data.weekdays_start,
    weekdays_end: data.weekdays_end,
    weekend_start: data.weekend_start,
    weekend_end: data.weekend_end,
    start_at: data.start_at,
    end_at: data.end_at,
  )
end
