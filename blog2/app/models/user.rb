class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
    
  has_many :members
  has_and_belongs_to_many :projects
  has_many :sections    
  has_many :deliverables
  has_many :embeds
  has_many :links   

    
  accepts_nested_attributes_for :projects
end

