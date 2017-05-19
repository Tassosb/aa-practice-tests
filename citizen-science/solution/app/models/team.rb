# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_one :project, class_name: "Experiment", foreign_key: :team_id
  has_many :memberships, class_name: "TeamMembership", foreign_key: :team_id
  has_many :members, through: :memberships, source: :member
end
