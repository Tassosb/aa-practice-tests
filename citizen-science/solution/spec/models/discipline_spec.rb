# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Discipline do
  subject(:bio) { Discipline.first }

  it "has a discipline tag" do
    tag_id = DisciplineTag.find_by(discipline_id: bio.id).id
    expect(bio.discipline_tags.first.id).to eq(tag_id)
  end

  it "has a experiment" do
    expect(bio.experiments.first.title).to eq("Amazon Aerobotany")
  end
end
