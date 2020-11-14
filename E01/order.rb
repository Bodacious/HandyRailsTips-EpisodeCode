# frozen_string_literal: true

require_relative 'application_record'
require_relative "random_ref"
class Order < ApplicationRecord
  # ==============================================================================
  # = Validations =
  # ==============================================================================

  validates :ref, presence: true, uniqueness: true

  # ==============================================================================
  # = Callbacks
  # ==============================================================================

  before_validation :set_ref, on: :create

  private

  def set_ref
    return if ref?

    self.ref = random_ref until ref.present? && self.class.where(ref: ref).none?
  end

  def random_ref
    RandomRef.new.to_s
  end
end
