class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"
    before do
        response.headers["Access-Control-Allow-Origin"]="*"
    end

    options "*" do
        response.headers["Access-Control-Allow-Methods"]="GET,POST,PUT,PATCH,DELETE,OPTIONS"
    end

#### crud for buyers #####

     # to get all buyers
        get "/buyers" do
            Buyer.all.to_json
        end

    # POST IN buyers
        post "/buyers" do
            buyers=Buyer.create(
                name: params[:name],
                email: params[:email],
                password: params[:password]
            )
            buyers.to_json
        end

    # DELETE IN Buyers
        delete "/buyers/:id" do
            buyers = Buyer.find(params[:id])
            buyers.destroy
            {message: "Buyer '#{buyers.name}' has been deleted."}.to_json
        end


#### crud for sellers ####

    # to get all sellers
        get "/sellers" do
            Seller.all.to_json
        end

    # POST in sellers
        post "/sellers" do
            sellers=Seller.create(
                name: params[:name],
                email: params[:email],
                password: params[:password]
            )
            sellers.to_json
        end


    # DELETE IN SELLERS
    delete "/sellers/:id" do
        sellers=Seller.find(params[:id])
        sellers.destroy
        {message: "seller '#{sellers.name}' has been deleted."}.to_json
    end     




#### crud for products ####

    # to get all products
       get "/products" do
           Product.all.to_json
       end


    #get one product
    get '/products/:id' do
        Product.find(params[:id]).to_json
    end

    # post in products
    post "/products" do
        products=Product.create(
            name: params[:name],
            price: params[:price],
            description: params[:description]
        )
        products.to_json
    end

    # delete in products
    delete "/products/:id" do
        products = Product.find(params[:id])
        products.destroy
        {message: "'#{products.name}' has been deleted."}.to_json
    end


#### crud for orders ####

   # to get all orders
    get "/orders" do
        Order.all.to_json
    end

   #get one order
    get '/orders/:id' do
        Order.find(params[:id]).to_json
    end

    # post in products
    post "/orders" do
         orders=Order.create(
         name: params[:name],
         price: params[:price],
         description: params[:description]
    )
    products.to_json
    end

    # delete in products
    delete "/products/:id" do
         orders = Order.find(params[:id])
         orders.destroy
         {message: "Your order'#{products.name}' has been deleted."}.to_json
    end

    post '/login' do
        user = Buyer.find_by(params[:buyer][:email])
        if user.password == params[:buyer][:password]
            user.to_json
        else
          {message: "Invalid email or password"}
        end
      end

        
end