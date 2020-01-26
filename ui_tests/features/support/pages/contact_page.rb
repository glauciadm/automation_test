class ContactPage
    include Capybara::DSL

    def initialize 
        @fieldSubject = '#id_contact';
        @txtEmail = '#email';
        @txtOrder = '#id_order';
        @txtMessage = '#message';
        @btnSendMessage = '#submitMessage';
        @msgSuccess = '.alert.alert-success'
    end

    def selectSubject
        boxSubject = find(@fieldSubject)
        boxSubject.find('option', text: 'Customer service').select_option
    end

    def setEmail(email)
        find(@txtEmail).set email
    end

    def setOrder(order)
        find(@txtOrder).set order
    end

    def setMessageText(text)
        find(@txtMessage).set text
    end

    def sendMessage
        find(@btnSendMessage).click
    end

    def getSuccessMsg
        find(@msgSuccess).text()
    end
end