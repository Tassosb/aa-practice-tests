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

require 'rails_helper'

describe TeamMembership do
  subject(:t_membership) { TeamMembership.first }

  it "has a team" do
    expect(t_membership.team.name).to eq("Wired Amazon")
  end

  it "has an member" do
    expect(t_membership.member.name).to eq("Varun Swamy")
  end
end
