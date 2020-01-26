class AccountPage
    include Capybara::DSL

    def initialize 
        @formTitle = '.page-heading';
        @msgAccount = '.info-account';
        @btnRegister = '#submitAccount';
        @linkHome = '.icon-home';
    end

    def getAccountMsg
        find(@msgAccount).text()
    end

    def getFormAccountTitle
        find(@formTitle).text()
    end

    def registerAccount
        find(@btnRegister).click
    end

    def accessHome
        find(@linkHome).click
    end

end