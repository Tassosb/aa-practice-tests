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

require 'rails_helper'

describe Experiment do
  subject(:experiment) { Experiment.first }

  it "has a volunteer" do
    expect(experiment.volunteers.first.username).to eq("tassosb")
  end

  it "has a team" do
    expect(experiment.team.name).to eq("Wired Amazon")
  end

  it "has a grant" do
    g_id = Grant.find_by(grantee_id: experiment.id).id
    expect(experiment.grants.first.id).to eq(g_id)
  end

  it "has a grantor" do
    expect(experiment.grantors.first.name).to eq("Rainforest Expeditions")
  end

  it "has a discipline_tag" do
    tag_id = DisciplineTag.find_by(experiment_id: experiment.id).id
    expect(experiment.discipline_tags.first.id).to eq(tag_id)
  end

  it "has a discipline" do
    expect(experiment.disciplines.first.name).to eq("Biology")
  end

  it "has a scientist" do
    expect(experiment.scientists.first.name).to eq("Varun Swamy")
  end
end
