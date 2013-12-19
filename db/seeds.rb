# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "emre", email: "info1100", full_name: "Emre Kılınç", password: "info1100", is_closed: false)
Project.create(name: "Dummy", body: "Dummy project", logo: "logo url here", is_active: true, order: 0, primary_color: "#000000")