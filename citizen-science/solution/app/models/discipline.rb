# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Discipline < ActiveRecord::Base
  has_many :discipline_tags
  has_many :experiments, through: :discipline_tags, source: :experiment
end
