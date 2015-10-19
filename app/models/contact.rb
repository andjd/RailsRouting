# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, :name, presence: true

  belongs_to :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
end
