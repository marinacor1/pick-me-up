class Driver < ActiveRecord::Base
  has_many :rider
  belongs_to :user
end
