class LoginPage
    include Capybara::DSL

    def acess
        visit '/'
    end

    def signinLink
        find(:xpath, '//a[@class="login"]').click
    end
    
    def email(email)
        find('#email').set email
    end

    def password(password)
        find('#passwd').set password
    end

    def signinSubmit
        find('#SubmitLogin').click
    end

    def infoAccount
        find('.info-account').text()
    end

end