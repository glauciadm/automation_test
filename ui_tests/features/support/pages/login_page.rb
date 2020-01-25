class LoginPage
    include Capybara::DSL

    def initialize
        @txtEmail = '#email';
        @txtPassword = '#passwd';
        @btnSignin = '#SubmitLogin';
        @msgAccount = '.info-account';
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

    def getAccountMsg
        find(@msgAccount).text()
    end

    def loginDefault
        find(linkSignin).click
        find(txtEmail).set 'glaucia.admachado@gmail.com'
        find(txtPassword).set 'abc123'
    end

end