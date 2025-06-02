class Contact < ApplicationRecord
  belongs_to :proponent

  enum contact_type: { residential_phone: 0, mobile: 1, whatsapp: 2, email: 3 }

  validates :contact_type, :value, presence: true
end
