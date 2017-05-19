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

end
