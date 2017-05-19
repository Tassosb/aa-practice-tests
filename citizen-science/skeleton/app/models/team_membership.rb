# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer          not null, primary key
#  team_id    :integer          not null
#  member_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class TeamMembership < ActiveRecord::Base

end
