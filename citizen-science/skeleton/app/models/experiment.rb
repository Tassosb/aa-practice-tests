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

class Experiment < ActiveRecord::Base

end
