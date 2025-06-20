class ChairOrder < ApplicationRecord
  TOTAL_CHAIRS = 50

  def self.available_units(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    
    overlapping_orders = ChairOrder.where('start_date < ? AND end_date > ?', end_date, start_date)
    units_alugadas = overlapping_orders.sum(:units)
    TOTAL_CHAIRS - units_alugadas
  end
end
