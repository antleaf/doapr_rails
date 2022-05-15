# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.destroy_all
User.destroy_all

admin_role = Role.create(name: 'admin')
editor_role = Role.create(name: 'editor')

admin_user = User.create(
  email: 'paul@paulwalk.net',
  forename: 'Paul',
  lastname: 'Walk'
)

admin_user.roles << admin_role
admin_user.roles << editor_role