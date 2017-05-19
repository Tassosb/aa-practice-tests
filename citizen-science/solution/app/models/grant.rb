# == Schema Information
#
# Table name: grants
#
#  id         :integer          not null, primary key
#  grantee_id :integer          not null
#  grantor_id :integer          not null
#  amount     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Grant < ActiveRecord::Base
  belongs_to :grantor, class_name: "Organization", foreign_key: :grantor_id
  belongs_to :grantee, class_name: "Experiment", foreign_key: :grantee_id
end
