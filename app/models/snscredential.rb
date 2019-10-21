class Snscredential < ApplicationRecord
  belongs_to :user, optional: true
end