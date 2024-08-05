# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[index], Service
    can %i[index], Week
    can %i[find], Shift
    can %i[index create update], Availability
  end
end
