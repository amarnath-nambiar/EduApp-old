
agent = Agent.create(:first_name=>"Demo", :last_name=>"Agent", :phone=>"1223334444", :password=>"12345", :email=>"demo@demo.com")
college = College.create(:full_name=>"Demo College of Engineering", :code=>"DCE", :address=> "Coimbatore, Tamilnadu", :city=>"Coimbatore", :country=>"India", :agent=>agent)
courses = Course.create([{:full_name=>"BE Computer Science and Engineering", short_name: "BE CSE", :about=>"Bachelors degree programme in computer science", :college=>college},
                         {:full_name=>"BE Information Technology", short_name: "BE IT", :about=>"Bachelors degree programme in information technology", :college=>college},
                         {:full_name=>"BE Electronics and Electrical Engineering", short_name: "BE EEE", :about=>"Bachelors degree programme in electronics and electrical", :college=>college}])

engineering = Interest.create(:title=>"Engineering")
Interest.create([{:title=>"Medical"}, {:title=>"Dental"}, {:title=>"Paramedical"}, {:title=>"Science"}, {:title=>"Arts"}, {:title=>"Commerce"}, {:title=>"Law"}, {:title=>"Sports"}])
computer = Interest.create(:title=>"Computer", :parent_interest_id=>engineering.id)
Interest.create(:title=>"Electronics", :parent_interest_id=>engineering.id)
Interest.create(:title=>"Electrical", :parent_interest_id=>engineering.id)
software = Interest.create(:title=>"Software", :parent_interest_id=>computer.id)
Interest.create(:title=>"Testing", :parent_interest_id=>software.id)
network=Interest.create(:title=>"Network", :parent_interest_id=>computer.id)

student = Student.create(:first_name=>"Demo", :last_name=>"Student", :phone=>"1234567890", :password=>"12345")

Lead.create(:student=>student, :course=>courses.first)
Lead.create(:student=>student, :course=>courses.last)

Reference.create(:full_name=>"Reference Candidate", :student=>student, :phone=>"1234567891")

StudentInterest.create(:student=>student, :interest=>engineering)
StudentInterest.create(:student=>student, :interest=>computer)
StudentInterest.create(:student=>student, :interest=>software)

CourseInterest.create(:course=>courses.first, :interest=>engineering)
CourseInterest.create(:course=>courses.first, :interest=>software)
CourseInterest.create(:course=>courses.second, :interest=>computer)
CourseInterest.create(:course=>courses.last, :interest=>network)