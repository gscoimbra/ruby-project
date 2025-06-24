class ChairOrder < ApplicationRecord
  TOTAL_CHAIRS = 50

  # Class method to calculate the number of chairs available
  def self.available_units(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    
    overlapping_orders = ChairOrder.where('start_date < ? AND end_date > ?', end_date, start_date)
    units_alugadas = overlapping_orders.sum(:units)
    validates :units, numericality: { greater_than: 0 }
    
    # Return the number of chairs still available
    TOTAL_CHAIRS - units_alugadas
  end
end
