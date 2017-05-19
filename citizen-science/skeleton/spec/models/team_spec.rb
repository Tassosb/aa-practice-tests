# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Team do
  subject(:team) { Team.first }

  it "has a project" do
    expect(team.project.title).to eq("Amazon Aerobotany")
  end

  it "has a membership" do
    mship_id = TeamMembership.find_by(team_id: team.id).id
    expect(team.memberships.first.id).to eq(mship_id)
  end

  it "had many members" do
    expect(team.members.first.name).to eq("Varun Swamy")
  end
end
