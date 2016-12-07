class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  has_many :galleries
  has_many :roles

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def admin?
    !!(roles.find_by_nombre('Admin'))
  end

  def editor?
    !!(roles.find_by_nombre('Editor'))
  end

  def basic?
    !!(roles.find_by_nombre('Basic'))
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
