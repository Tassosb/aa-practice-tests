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

require 'rails_helper'

describe Scientist do
  let(:varun) { Scientist.find_by(name: "Varun Swamy") }

  it "has a team_membership" do
    mship_id = TeamMembership.find_by(member_id: varun.id).id
    expect(varun.team_memberships.first.id).to eq(mship_id)
  end

  it "has an experiment" do
    expect(varun.experiments.first.title).to eq("Amazon Aerobotany")
  end

  it "has a team" do
    expect(varun.teams.first.name).to eq("Wired Amazon")
  end

  it "has an organization" do
    expect(varun.organization.name).to eq("San Diego Zoo Institute for Conservation Research")
  end
end
