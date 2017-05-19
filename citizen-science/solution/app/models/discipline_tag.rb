# == Schema Information
#
# Table name: discipline_tags
#
#  id            :integer          not null, primary key
#  experiment_id :integer          not null
#  discipline_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class DisciplineTag < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :experiment
end
