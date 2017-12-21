class Vehicle < ApplicationRecord
  has_many :accounts
  has_many :users, through: :accounts
  has_many :fill_ups
  has_many :services

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def average_mpg
    array_of_mpgs = []
    fill_ups.each do |fill_up|
      next if fill_up.mpg.nil?
      array_of_mpgs.push(fill_up.mpg)
    end
    array_of_mpgs.sum.to_f / array_of_mpgs.length
  end
  #in instance you will be calling an existing @vehicle.average_mpg

  def lifetime_cost_of_fuel
    array_of_costs = []
    fill_ups.each do |fill_up|
      next if fill_up.total_cost.nil?
      array_of_costs.push(fill_up.total_cost)
    end
    array_of_costs.sum.to_f
  end

end
