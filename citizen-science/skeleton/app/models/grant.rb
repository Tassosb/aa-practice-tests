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

end
