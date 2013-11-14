class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => {
          :with => /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]{2,5}$/,
          :message => "Email Format should be *@*.*"
        }
  validates :password, :presence => true

  has_many :created_events, :class_name =>"Event"
  has_many :event_attendances
  has_many :attended_events, :through => :event_attendances, :source => :event

  has_secure_password
end
