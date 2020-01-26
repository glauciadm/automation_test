class LoginPage
    include Capybara::DSL

    def initialize
        @txtEmail = '#email';
        @txtPassword = '#passwd';
        @btnSignin = '#SubmitLogin';
        @txtNewEmailAccount = '#email_create';
        @btnCreateAccount = '#SubmitCreate';
        @msgErroCreateAccount = '#create_account_error';
        @linkForgotPassord = 'a[href="http://automationpractice.com/index.php?controller=password"]';
        @btnRetrievePassword = '.btn.btn-default.button.button-medium';
        @msgRetrievePassword = '.alert.alert-success';

    end

    def setEmail(email)
        find(@txtEmail).set email
    end

    def setPassword(password)
        find(@txtPassword).set password
    end

    def clickSubmit
        find(@btnSignin).click
    end

    def loginDefault
        find(@txtEmail).set 'glaucia.admachado@gmail.com'
        find(@txtPassword).set 'abc123'
        find(@btnSignin).click
    end

    def createEmail(email)
        find(@txtNewEmailAccount).set email
    end

    def createAccount
        find(@btnCreateAccount).click
    end

    def getErrorMsg
        find(@msgErroCreateAccount).text()
    end

    def getPassword
        find(@linkForgotPassord).click
    end

    def retrievePassword
        find(@btnRetrievePassword).click
    end

    def getRetrievePasswordMsg
        find(@msgRetrievePassword).text()
    end

end