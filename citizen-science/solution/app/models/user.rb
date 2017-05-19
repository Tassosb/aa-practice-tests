# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :classifications
  has_many :projects, through: :classifications, source: :experiment
end
