class Profile < ActiveRecord::Base
  belongs_to :user


  validates :gender, inclusion: { in: %w(male female), message: "Gender must be male or female"}

  validate :notnull, :notfemname

  def self.get_all_profiles(min_year, max_year)
  	
   profile_query = self.where("birth_year BETWEEN ? AND ?", min_year, max_year).to_a.sort! {|a,b| a.birth_year <=> b.birth_year}

  end

  def notfemname
  	if (first_name == "Sue" && gender == "male")
  		errors.add(:first_name, "Not a male Name")
  	end
  end
  def notnull
  	if (first_name.nil? && last_name.nil?)
  		errors.add(:first_name, "Specify first or last name!")
  	end
  end

end
