class IphoneRatingsController < ApplicationController

	def get_data 
		response = HTTParty.get('https://api.appannie.com//v1.1/apps/ios/app/552799694/ratings', :headers => { "Authorization" => "bearer 6dd4f48d473b0cd4d3cf4d8b8c8a8c3529163bba"})
		@rhash=response.parsed_response #method to parse to get hash
		@rating_list_array=@rhash["rating_list"] #gets values for rating_list key (each value is an array)
		@current_ratings={}


		@rating_list_array.each do |item| 
			if item["country"] == "US"
				@us_hash=item
				@us_current_ratings_hash=@us_hash["current_ratings"]
				@us_all_ratings_hash=@us_hash["all_ratings"]
				@current_ratings["Date"]=Time.now.to_date
				@current_ratings["star_1_count"]=@us_current_ratings_hash["star_1_count"]
				@current_ratings["star_2_count"]=@us_current_ratings_hash["star_2_count"]
				@current_ratings["star_3_count"]=@us_current_ratings_hash["star_3_count"]
				@current_ratings["star_4_count"]=@us_current_ratings_hash["star_4_count"]
				@current_ratings["star_5_count"]=@us_current_ratings_hash["star_5_count"]
			end
		end


		render :json => @current_ratings

	end

	def save_to_db
		response = HTTParty.get('https://api.appannie.com//v1.1/apps/ios/app/552799694/ratings', :headers => { "Authorization" => "bearer 6dd4f48d473b0cd4d3cf4d8b8c8a8c3529163bba"})
		rhash1=response.parsed_response #method to parse to get hash
		@rating_list_array1=rhash1["rating_list"] #gets values for rating_list key (each value is an array)
		

		@rating_list_array1.each do |item| 
			if item["country"] == "US"
				@us_hash1=item
				@current=@us_hash1["current_ratings"]
				@all=@us_hash1["all_ratings"]
				a=IphoneRatings.new( date: Time.now.to_date, onestar: @current["star_1_count"], twostar: @current["star_2_count"], threestar: @current["star_3_count"], fourstar: @current["star_4_count"], fivestar: @current["star_5_count"])
				a.save unless IphoneRatings.exists?(:date => a.date)
			end
		end

	render text: "lala"

	end

	def show
      @ratings1 = IphoneRatings.all
      render "iphone_ratings/iphone_ratings"
    end

end
