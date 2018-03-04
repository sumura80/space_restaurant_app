class Store < ApplicationRecord
	belongs_to :category
	validates :description, presence: true
	validates :company, presence: true
end
