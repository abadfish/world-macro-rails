class Position < ActiveRecord::Base
  has_many :trade_details
  accepts_nested_attributes_for :trade_details



end
