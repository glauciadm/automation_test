class HomePage
    include Capybara::DSL

    def initialize 
        @linkSignin = '.login';
        @linkSignout = '.logout';
        @linkContactUs = '#contact-link';
    end
    
    def access
        visit '/'
    end

    def accessSignin
        find(@linkSignin).click
    end

    def accessSignout
        find(@linkSignout).click
    end

    def makeContact
        find(@linkContactUs).click
    end
  

end