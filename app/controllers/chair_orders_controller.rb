class ChairOrdersController < ApplicationController
  def availability
    start_date = params[:start_date]
    end_date = params[:end_date]
    units = params[:units].to_i

    available = ChairOrder.available_units(start_date, end_date)
    can_rent = available >= units

    render json: { can_rent: can_rent, available: available }
  end

  def create
    start_date = params[:start_date]
    end_date = params[:end_date]
    units = params[:units].to_i

    available = ChairOrder.available_units(start_date, end_date)
    if available >= units
      order = ChairOrder.create!(start_date: start_date, end_date: end_date, units: units)
      render json: order, status: :created
    else
      render json: { error: "Not enough chairs available", available: available }, status: :unprocessable_entity
    end
  end
end

