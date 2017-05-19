# == Schema Information
#
# Table name: scientists
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Scientist < ActiveRecord::Base
  has_many :team_memberships, foreign_key: :member_id
  has_many :teams, through: :team_memberships, source: :team
  has_many :experiments, through: :teams, source: :project
  belongs_to :organization
end
