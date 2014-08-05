class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :collaborators, class_name: "User", through: :projects
  
end
