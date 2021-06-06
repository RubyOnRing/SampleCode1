class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable #, :registerable,
  #        :recoverable, :rememberable, :validatable, request_keys: [:subdomain]

  belongs_to :entity

  USER_TYPE = %w[Client Staff Manager].freeze

  validates_inclusion_of :type, in: USER_TYPE

  before_create :set_subdomain

  class << self
    def types
      USER_TYPE
    end

    # def find_for_authentication(warden_conditions)
    #   where(email: warden_conditions[:email], subdomain: warden_conditions[:subdomain]).first
    # end
  end

  private

  def set_subdomain
    self.subdomain = entity.subdomain
  end
end
