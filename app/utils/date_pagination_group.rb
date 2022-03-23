require 'date'
require 'set'
require 'json'

def sort_by_date(dates, direction = 'ASC')
    sorted = dates.sort
    sorted.reverse! if direction == 'DESC'
    return sorted
end

class DatePaginationGroup
    attr_accessor :dates, :page_size

    def initialize(dates = [], page_size = 7)
        @dates = dates
        @page_size = page_size
        sort
    end

    def add_date(date)
        @dates << date
        sort
    end

    def build_year_month_pair(date)
        return "#{date.year},#{date.month}"
    end

    def get_hash
        ymps = get_year_month_pairs
        used_ymps = Set.new

        hash = {}

        ymps.each { |ymp| hash[ymp] = [] }

        @dates.each do |date|
            ymp = build_year_month_pair(date)
            if hash[ymp].length == 0
                hash[ymp] = [[date]]
            else
                if hash[ymp].last.length < @page_size
                    hash[ymp].last << date
                else
                    hash[ymp] << [date]
                end
            end
        end

        return hash
    end

    def get_year_month_pairs
        set = Set.new # set of strings (year,month) "2022,1", "2022,4", "2022,12"
        @dates.each { |date| set.add(build_year_month_pair(date)) }
        return set.to_a
    end

    private

    def sort
        newdates = sort_by_date(@dates, direction: 'ASC')
        @dates = newdates
    end
end

# dates = [
#     Date.new(2022, 1, 1),
#     Date.new(2022, 1, 3),
#     Date.new(2022, 1, 4),
#     Date.new(2022, 1, 5),
#     Date.new(2022, 1, 7),
#     Date.new(2022, 1, 9),
#     Date.new(2022, 1, 11),
#     Date.new(2022, 1, 13),
#     Date.new(2023, 1, 13),
#     Date.new(2023, 5, 1),
#     Date.new(2023, 5, 2),
#     Date.new(2023, 5, 3),
#     Date.new(2023, 5, 4),
#     Date.new(2023, 5, 5),
#     Date.new(2023, 5, 6),
#     Date.new(2023, 5, 7),
#     Date.new(2023, 5, 8),
#     Date.new(2023, 5, 9),
#     Date.new(2023, 6, 1),
#     Date.new(2023, 6, 2),
#     Date.new(2023, 6, 3),
#     Date.new(2023, 7, 1),
#     Date.new(2024, 1, 13),
#     Date.new(2025, 1, 13)
# ]

# dpg = DatePaginationGroup.new(dates)
# dpg.add_date(Date.new(2000, 1, 1))
# puts dpg.dates
# puts dpg.get_year_month_pairs
# puts dpg.get_hash.to_json
