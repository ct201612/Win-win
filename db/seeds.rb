# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "创建public jobs"

create_jobs = for i in ["技术", "财务", "设计", "运营", "市场", "销售", "客服"] do
  for j in ["北京", "上海", "深圳", "广州", "杭州", "成都", "香港", "海外"] do
    Job.create!([name: "Job", content: "test ",
      wage_upper_bound: rand(10..12), wage_lower_bound: rand(7..9), is_hidden: "false",
      company: "test", category: "#{i}", location: "#{j}",
      contact_email: "test@te.op", user_id: "1"])
  end
end
puts "56 Public jobs created."
