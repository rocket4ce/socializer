class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :portafolios
  has_one :perfil
  has_many :comentarios, :through => :portafolios
  has_many :uploads, :through => :portafolios
  acts_as_follower
  acts_as_followable
end
