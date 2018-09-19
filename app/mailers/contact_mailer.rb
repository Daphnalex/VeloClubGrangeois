class ContactMailer < ApplicationMailer
  def contact_message(contact)
    @contact = contact
    mail(to: "daphne.bordel@gmail.com",
         from: contact.email,
         subject: "Formulaire de contact")
   end

end
