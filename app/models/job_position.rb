class JobPosition < ActiveRecord::Base
  validates_presence_of :position, :description

  validates_length_of :description, :maximum => 500

  belongs_to :company

  attr_accessible :description, :position, :start_date
end
