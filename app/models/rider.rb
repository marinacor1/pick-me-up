class Rider < ActiveRecord::Base
  has_many :drivers
  belongs_to :user
end
