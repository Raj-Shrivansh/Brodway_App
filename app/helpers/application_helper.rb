module ApplicationHelper
    def star_rating(rating, max_rating = 5)
        full_stars = rating.floor
        half_star = rating % 1 > 0 ? 1 : 0
        empty_stars = max_rating - full_stars - half_star
    
        stars_html = ''
        full_stars.times { stars_html += tag.i '', class: 'fas fa-star' }
        half_star.times { stars_html += tag.i '', class: 'fas fa-star-half-alt' }
        empty_stars.times { stars_html += tag.i '', class: 'far fa-star' }
    
        stars_html.html_safe
      end
end
