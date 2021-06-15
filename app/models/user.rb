class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable #, :registerable,
  #        :recoverable, :rememberable, :validatable, request_keys: [:subdomain]

  USER_TYPE = %w[Client Staff Manager].freeze

  validates_inclusion_of :type, in: USER_TYPE

  has_one_attached :avatar
  belongs_to :entity

  delegate :name, to: :entity, allow_nil: true, prefix: true

  before_create :set_subdomain

  class << self
    def types
      USER_TYPE
    end

    # def find_for_authentication(warden_conditions)
    #   where(email: warden_conditions[:email], subdomain: warden_conditions[:subdomain]).first
    # end
  end

  def avatar_url
    if avatar.attached?
      rails_blob_url(avatar, only_path: true)
    else
      ActionController::Base.helpers.image_url("default_avatar.png")
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_subdomain
    self.subdomain = entity.subdomain
  end
end
