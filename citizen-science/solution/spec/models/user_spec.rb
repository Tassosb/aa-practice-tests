# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe User do
  subject(:user) { User.first }

  it "has a classification" do
    cl_id = Classification.find_by(user_id: user.id).id
    expect(user.classifications.first.id).to eq(cl_id)
  end

  it "has a project" do
    expect(user.projects.first.title).to eq("Amazon Aerobotany")
  end
end
