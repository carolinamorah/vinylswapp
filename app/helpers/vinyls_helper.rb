module VinylsHelper
    def genres_options
        Vinyl
          .connection
          .select_rows('select distinct unnest(genre) from vinyls')
          .flatten
    end
end
