require 'active_record'

# Repository.all.each do |record|
#   puts record.slug
# end

puts "slug,name"
Discipline.all.each do |record|
  puts "#{record.slug},#{record.name}"
end