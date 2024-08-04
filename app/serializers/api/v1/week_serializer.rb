class Api::V1::WeekSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :range
  
  def name
    "Semana #{object.number} del #{object.year}"    
  end

  def range
    since = Date.strptime("#{object.year}W#{format('%02d', object.number)}", "%GW%V").at_beginning_of_week.strftime('%d/%m/%Y')
    to = Date.strptime("#{object.year}W#{format('%02d', object.number)}", "%GW%V").at_end_of_week.strftime('%d/%m/%Y')

    "Del #{since} al #{to}"    
  end
end
