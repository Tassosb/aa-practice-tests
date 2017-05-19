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

require 'rails_helper'

describe Grant do
  subject(:grant) { Grant.first }

  it "has a grantor" do
    expect(grant.grantor.name).to eq("Rainforest Expeditions")
  end

  it "has a grantee" do
    expect(grant.grantee.title).to eq("Amazon Aerobotany")
  end
end
