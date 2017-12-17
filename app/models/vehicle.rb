class Vehicle < ApplicationRecord
  has_many :accounts
  has_many :users, through: :accounts
  has_many :fill_ups
  has_many :services

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
