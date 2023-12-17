class Tag < ApplicationRecord
  has_and_belongs_to_many :airfryers
  has_and_belongs_to_many :daily_savings
end
