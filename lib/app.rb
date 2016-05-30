require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price
	products_hash["items"].each do |toy|
	  purchases_count = toy["purchases"].length
		purchases_sum = 0
		toy["purchases"].each {|purchase_record| purchases_sum += Float(purchase_record["price"])}
		average_price = purchases_sum / purchases_count
		average_discount = 100 - (average_price / Float(toy["full-price"]) * 100)
		puts toy["title"]
		puts "**********************"
		puts "Retail Price: #{toy["full-price"]}"
		puts "Total Purchases: #{purchases_count}"
		puts "Total Sales: #{purchases_sum}"
		puts "Average Price: #{average_price}"
		puts "Average Discount: #{average_discount.round(2)}%"
		puts
	end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

	#assming that I know there are only two brands
	LEGO = "LEGO"
	lego_num = 0
	lego_retail_price_sum = 0
	lego_sales = 0
	NANO = "Nano Blocks"
	nano_num = 0
	nano_retail_price_sum = 0
	nano_sales = 0
	products_hash["items"].each do |product|
		if product["brand"] == LEGO
			lego_num += 1
			lego_retail_price_sum += Float(product["full-price"])
			lego_sales += product["purchases"].length
		elsif product["brand"]  == NANO
			nano_num += 1
			nano_retail_price_sum += Float(product["full-price"])
			nano_sales += product["purchases"].length
		else
			puts "error"
		end
	end

	puts LEGO
	puts "**************"
	puts "Number of Products: #{lego_num}"
	puts "Average Product Price: #{(lego_retail_price_sum / lego_num).round(2)}"
	puts "Total Sales: #{lego_sales}"
	puts

	puts NANO
	puts "**************"
	puts "Number of Products: #{nano_num}"
	puts "Average Product Price: #{(nano_retail_price_sum / nano_num).round(2)}"
	puts "Total Sales: #{nano_sales}"
	puts
