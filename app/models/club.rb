class Club < ApplicationRecord
  before_save { self.mail = mail.downcase }
   
end
