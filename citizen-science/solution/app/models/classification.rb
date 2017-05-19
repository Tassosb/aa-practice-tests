# == Schema Information
#
# Table name: classifications
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  experiment_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Classification < ActiveRecord::Base
  belongs_to :user
  belongs_to :experiment
end
