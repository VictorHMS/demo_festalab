class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  CPF_PATTERN = /\A(\d{3})\.?(\d{3})\.?(\d{3})\-?(\d{2})\z/
  PHONE_PATTERN = /\A(\+\d{2})?((\(\d{2}\))|(\d{2}))((\d{5}|\d{4})(-?)\d{4})\z/
end
