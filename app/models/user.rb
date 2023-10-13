class User < ApplicationRecord
    validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "inválido"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
    
    validates :cpf,
    format: { with: CPF_PATTERN, message: "inválido"}

    validates :phone,
    format: { with: PHONE_PATTERN, message: "inválido"}

    def showPhone
        showP = ""
        self.phone.split('').each_with_index do |ch,i|
            showP += ch
            showP += i==2? '(' : ''
            showP += i==4? ')' : ''
            showP += i==9? '-' : ''
        end
        showP
    end

    def showCpf
        showC = ""
        self.cpf.split('').each_with_index do |ch,i|
            showC += ch
            showC += i==2? '.' : ''
            showC += i==5? '.' : ''
            showC += i==8? '-' : ''
        end
        showC
    end

    def self.processQuery(query, typeSearch)
        ans = query
        if typeSearch == "phone"
            ans = ""
            query.split('').each do |ch|
                if ch =~ /[\d\+]/
                    ans += ch
                end
            end
        elsif typeSearch == "cpf"
            ans = ""
            query.split('').each do |ch|
                if ch =~ /\d/
                    ans += ch
                end
            end
        end
        ans
    end

    scope :search, ->(typeSearch,query){ where("#{typeSearch} like ?", "%#{self.processQuery(query,typeSearch)}%")}
end
