class User < ApplicationRecord
    validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "inválido"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
    
    validates :cpf,
    format: { with: CPF_PATTERN, message: "inválido"}

    validates :phone,
    format: { with: PHONE_PATTERN, message: "inválido"}

    scope :search, ->(typeSearch,query){ where("#{typeSearch} like ?", "%#{query}%")}
end
