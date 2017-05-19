# == Schema Information
#
# Table name: experiments
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  team_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Experiment < ActiveRecord::Base
  has_many :classifications
  has_many :volunteers, through: :classifications, source: :user
  belongs_to :team
  has_many :grants, foreign_key: :grantee_id
  has_many :grantors, through: :grants, source: :grantor
  has_many :discipline_tags
  has_many :disciplines, through: :discipline_tags, source: :discipline
  has_many :scientists, through: :team, source: :members
end
