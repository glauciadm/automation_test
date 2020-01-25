class HomePage
    include Capybara::DSL

    def initialize 
        @linkSignin = '.login';
    end
    
    def access
        visit '/'
    end

    def accessSignin
        find(@linkSignin).click
   end
end