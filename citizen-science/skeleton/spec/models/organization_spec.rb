# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Organization do
  let(:sd_zoo) { Organization.find_by(name: "San Diego Zoo Institute for Conservation Research") }
  let(:rain_exp) { Organization.find_by(name: "Rainforest Expeditions") }

  it "has a scientist" do
    expect(sd_zoo.scientists.first.name).to eq("Varun Swamy")
  end

  it "has an project" do
    expect(rain_exp.projects.first.title).to eq("Amazon Aerobotany")
  end

  it "has a grant" do
    grant_id = Grant.find_by(grantor_id: rain_exp.id).id
    expect(rain_exp.grants.first.id).to eq(grant_id)
  end
end
