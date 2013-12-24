#Users of the app
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #Virtual field
  attr_accessor :login
  
  validates :name, :lastname, presence: true, length: { in: 2..50 }
  validates :username, presence: true, uniqueness:{case_sensitive:false}, length: { in: 2..20 }
 
  # Find User by username or email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
