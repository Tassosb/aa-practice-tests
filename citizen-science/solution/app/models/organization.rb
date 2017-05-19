# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Organization < ActiveRecord::Base
  has_many :grants, foreign_key: :grantor_id
  has_many :projects, through: :grants, source: :grantee
  has_many :scientists, class_name: "Scientist", foreign_key: :organization_id
end
