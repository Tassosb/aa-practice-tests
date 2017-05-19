# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  #ORGANIZATIONS
  rainforest_exp = Organization.create(
  id: rand_id,
  name: "Rainforest Expeditions"
  )
  sd_zoo = Organization.create(
  id: rand_id,
  name: "San Diego Zoo Institute for Conservation Research"
  )

  ### SETUP SCIENTISt
  varun = Scientist.create(
    id: rand_id,
    name: "Varun Swamy",
    organization_id: sd_zoo.id
  )

  #TEAM
  a_team = Team.create(id: rand_id, name: "Wired Amazon")
  a_team_membership = TeamMembership.create(
    id: rand_id,
    team_id: a_team.id,
    member_id: varun.id
    )

  amazon = Experiment.create(
    id: rand_id,
    title: "Amazon Aerobotany",
    team_id: a_team.id
  )


  #GRANTS
  g = Grant.create(
    id: rand_id,
    grantee_id: amazon.id,
    grantor_id: rainforest_exp.id,
    amount: 1000,
  )


  ### DISCIPLINE
  bio = Discipline.create(id: rand_id, name: "Biology")
  bio_tag = DisciplineTag.create(
    id: rand_id,
    experiment_id: amazon.id,
    discipline_id: bio.id
  )

  ### SETUP USER
  u = User.create(id: rand_id, username: "tassosb")
  cl = Classification.create(id: rand_id, user_id: u.id, experiment_id: amazon.id)
end
