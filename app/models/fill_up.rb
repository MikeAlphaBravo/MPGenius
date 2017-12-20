class FillUp < ApplicationRecord
  belongs_to :vehicle

  # before_save :calculate_mpg
  # def calculate_mpg
  #   previous_fill_up_mileage = vehicle.fill_ups.last.odometer_reading
  #   current_fill_up_mileage = odometer_reading
  #   mileage_difference = current_fill_up_mileage - previous_fill_up_mileage
  #   current_mpg = mileage_difference.to_f / gallons_in_fill
  #   mpg = current_mpg
  # end
end
