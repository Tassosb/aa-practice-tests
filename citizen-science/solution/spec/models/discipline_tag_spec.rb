# == Schema Information
#
# Table name: discipline_tags
#
#  id            :integer          not null, primary key
#  experiment_id :integer          not null
#  discipline_id :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

describe DisciplineTag do
  subject(:bio_tag) { DisciplineTag.first }

  it "has a discipline" do
    expect(bio_tag.discipline.name).to eq("Biology")
  end

  it "has an experiment" do
    expect(bio_tag.experiment.title).to eq("Amazon Aerobotany")
  end
end
