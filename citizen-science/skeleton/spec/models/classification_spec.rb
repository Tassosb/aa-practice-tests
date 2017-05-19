# == Schema Information
#
# Table name: classifications
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  experiment_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

describe Classification do
  subject(:classification) { Classification.first }

  it "has a user" do
    u_id = User.find_by(username: "tassosb").id
    expect(classification.user.id).to eq(u_id)
  end

  it "has an experiment" do
    expect(classification.experiment.title).to eq("Amazon Aerobotany")
  end
end
