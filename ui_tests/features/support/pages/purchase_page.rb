class PurchasePage
    include Capybara::DSL

    def initialize
        @btnCart = '.exclusive';
        @msgAddCart = '.icon-ok';
    end
    
    def viewProduct
        find(:xpath, "(//div[@class='product-container'])[1]").click
    end

    def addToCart
        find(@btnCart).click
    end

    def getMsgAddCart
        find(:xpath,"//span[@class='cross']/following-sibling::h2").text()
    end

end