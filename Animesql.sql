


Select *
From anime


--Data Cleaning

ALTER TABLE anime 
ALTER COLUMN score float

ALTER TABLE anime
ALTER COLUMN start_date date

ALTER TABLE anime
ALTER COLUMN end_date date

UPDATE anime SET studios=TRIM(studios)






-- Data Manipulation for Tableau Views



--   Top popularity 

Select title, genres,num_episodes,studios, popularity_rank , type
From anime
Where status = 'Finished Airing' AND popularity_rank <> 0
order by popularity_rank 







--  Top Score 

Select title, genres,num_episodes,studios, score
From anime
Where status = 'Finished Airing'
order by score DESC


--  Top Studios Avarege Score 

Select studios, AVG(CAST(score as float)) AS Avarage_score
From anime
Group by studios
Order by Avarage_score DESC


--  Anime release chronology   

Select YEAR (start_date ), COUNT(start_date) AS anime_counter
From anime
Group by YEAR(start_date)
Order by anime_counter DESC


--  Top Anime dropped 


Select title, genres, dropped_count
From anime
Order by dropped_count DESC


--Top scored Anime per type

Select type, AVG(score) as avarage_score
From anime
Group by type




-- Genres popularity rank






--Select genres, SUM(popularity_rank) AS popularity_rank
--From anime
--Group by genres
--Order by popularity_rank DESC



--Select SUM(count)
--From (Select COUNT(genres) as count 
--	  From anime
--	  Where genres LIKE '%Action%'
--	  Group by genres) as c 


   




Select DISTINCT genres
From anime





-- Top tv series

	Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'TV'
	order by score DESC
	
-- Top Movies 

   Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'MOVIE'
	order by score DESC

-- Top OVAs
   
   Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'OVA'
	order by score DESC
	

	-- Total anime released

	Select COUNT(*) AS anime_released
	From anime





	

	-- Total anime TV series released

	Select COUNT(*) AS anime_tv_series_released
	From anime
	Where type = 'TV'

	-- Total anime Movies released

	Select COUNT(*) AS anime_movies_released
	From anime
	Where type = 'MOVIE'

	--Total OVAS anime released

	Select COUNT(*) AS anime_ovas_released
	From anime
	Where type = 'OVA'

	--Total ONAS anime released

	Select COUNT(*) AS anime_onas_released
	From anime
	Where type = 'ONA'

	--Total Special anime released

	Select COUNT(*) AS anime_special_released
	From anime
	Where type = 'SPECIAL'





	--Total anime per genres 

	CREATE VIEW AvaragePerGenres AS

	Select 'action' as genre,AVG(score) as action
	From anime
	Where Genres LIKE '%Action%' 
	UNION
	Select 'adventure' as genre, AVG(score) as adventure
	From anime
	Where Genres LIKE '%Adventure%'
	UNION
	Select 'comedy' as genre, AVG(score) as comedy
	From anime
	Where  Genres LIKE '%Comedy%'
	UNION
	Select  'drama' as genre, AVG(score) as drama
	From anime
	Where Genres LIKE '%Drama%'
	UNION
	Select  'fantasy' as genre, AVG(score) as fantasy
	From anime
	Where Genres LIKE '%Fantasy%'
	UNION
	Select  'horror' as genre,AVG(score) as horror
	From anime
	Where Genres LIKE '%Horror%'
	UNION
	Select  'mystery' as genre, AVG(score) as mystery
	From anime
	Where Genres LIKE '%Mystery%'
	UNION
	Select 'romance' as genre, AVG(score) as romance
	From anime
	Where Genres LIKE '%Romance%'
	UNION
	Select  'fantasy' as genre, AVG(score) as fantasy
	From anime
	Where Genres LIKE '%Sci-Fi%'
	UNION
	Select  'slice_of_life' as genre,AVG(score) as slice_of_life
	From anime
	Where Genres LIKE '%Slice of Life%'
	UNION
	Select  'sports' as genre, AVG(score) as sports
	From anime
	Where Genres LIKE '%Sports%'
	UNION
	Select  'supernatural' as genre, AVG(score) as supernatural
	From anime
	Where Genres LIKE '%Supernatural%'
	UNION
	Select  'ecchi' as genre, AVG(score) as ecchi
	From anime
	Where Genres LIKE '%Ecchi%'
	UNION
	Select  'hentai' as genre, AVG(score) as hentai
	From anime
	Where Genres LIKE '%Hentai%'
	
	




	--Avarage score per genres


	Select DISTINCT
	(Select AVG(Score) as action
	From anime2
	Where Genres LIKE '%Action%')as action,

	(Select AVG(Score) as adventure
	From anime2
	Where Genres LIKE '%Adventure%') as adventure,


	(Select AVG(Score) as comedy
	From anime2
	Where Genres LIKE '%Comedy%') as comedy,

	(Select AVG(Score) as drama
	From anime2
	Where Genres LIKE '%Drama%') as drama,


	(Select AVG(Score) as fantasy
	From anime2
	Where Genres LIKE '%Fantasy%') as fantasy,


	(Select AVG(Score) as horror
	From anime2
	Where Genres LIKE '%Horror%') as horror,

	(Select AVG(Score) as mystery
	From anime2
	Where Genres LIKE '%Mystery%') as mystery,

	(Select AVG(Score) as romance
	From anime2
	Where Genres LIKE '%Romance%') as romance,

	(Select AVG(Score) as fantasy
	From anime2
	Where Genres LIKE '%Sci-Fi%') as sci_fi,


	(Select AVG(Score) as slice_of_life
	From anime2
	Where Genres LIKE '%Slice of Life%') as slice_of_life,


	(Select AVG(Score) as sports
	From anime2
	Where Genres LIKE '%Sports%') as sports,


	(Select AVG(Score) as supernatural
	From anime2
	Where Genres LIKE '%Supernatural%') as supernatural,

	(Select AVG(Score) as ecchi
	From anime2
	Where Genres LIKE '%Ecchi%') as ecchi,

	(Select AVG(Score) as hentai
	From anime2
	Where Genres LIKE '%Hentai%') as hentai

	From anime2



	--Total anime per genres 
	Select DISTINCT
	(Select COUNT(*) as action
	From anime2
	Where Genres LIKE '%Action%')as action,

	(Select COUNT(*) as adventure
	From anime2
	Where Genres LIKE '%Adventure%') as adventure,


	(Select COUNT(*) as comedy
	From anime2
	Where Genres LIKE '%Comedy%') as comedy,

	(Select COUNT(*) as drama
	From anime2
	Where Genres LIKE '%Drama%') as drama,


	(Select COUNT(*) as fantasy
	From anime2
	Where Genres LIKE '%Fantasy%') as fantasy,


	(Select COUNT(*) as horror
	From anime2
	Where Genres LIKE '%Horror%') as horror,

	(Select COUNT(*) as mystery
	From anime2
	Where Genres LIKE '%Mystery%') as mystery,

	(Select COUNT(*) as romance
	From anime2
	Where Genres LIKE '%Romance%') as romance,

	(Select COUNT(*) as fantasy
	From anime2
	Where Genres LIKE '%Sci-Fi%') as sci_fi,


	(Select COUNT(*) as slice_of_life
	From anime2
	Where Genres LIKE '%Slice of Life%') as slice_of_life,


	(Select COUNT(*) as sports
	From anime2
	Where Genres LIKE '%Sports%') as sports,


	(Select COUNT(*) as supernatural
	From anime2
	Where Genres LIKE '%Supernatural%') as supernatural,

	(Select COUNT(*) as ecchi
	From anime2
	Where Genres LIKE '%Ecchi%') as ecchi,

	(Select COUNT(*) as hentai
	From anime2
	Where Genres LIKE '%Hentai%') as hentai

	From anime2




	--History of  release per types






	With TVcte (start_year,tv_series_released) AS (

												Select YEAR(start_date) as start_year, COUNT(*) AS anime_tv_series_released
												From anime
												Where type = 'TV'
												group by YEAR(start_date)
												),
	 MOVIEcte (start_year,movies_released) AS (

										Select   YEAR(start_date) as start_year,COUNT(*) AS anime_movies_released
										From anime
										Where type = 'MOVIE'
										group by YEAR(start_date)
										),

	 OVAScte (start_year,ovas_released) AS (

										Select  YEAR(start_date) as start_year,COUNT(*) AS anime_ovas_released
										From anime
										Where type = 'OVA'
										group by YEAR(start_date)
										),

	 ONActe (start_year,ona_released) AS (

										Select  YEAR(start_date) as start_year,COUNT(*) AS anime_onas_released
										From anime
										Where type = 'ONA'
										group by YEAR(start_date)
										),

	 SPECIALcte (start_year,special_released) AS (

										Select  YEAR(start_date) as start_year,COUNT(*) AS anime_special_released
										From anime
										Where type = 'SPECIAL'
										group by YEAR(start_date)
										)
     
	 --Select * 
	 --from SPECIALcte


	 Select movie.start_year , tv.tv_series_released,movie.movies_released,ova.ovas_released,ona.ona_released,special.special_released
	 From(Select * From TVcte ) as tv FULL JOIN (Select * From MOVIEcte ) as movie ON tv.start_year = movie.start_year  FULL JOIN (Select * From OVAScte ) as ova ON movie.start_year = ova.start_year   FULL JOIN  (Select * From ONActe ) as ona ON ova.start_year = ona.start_year  FULL JOIN (Select * From SPECIALcte ) as special ON ona.start_year = special.start_year

	


	
	--Audience Preferencies--



	--Top Studios Per Avarage Score


	Select value , AVG(Score) as avarage_score
    From anime2
    CROSS APPLY STRING_SPLIT(Studios, ',')
	GROUP BY value
	order by avarage_score DESC


	Select *
	From anime2

	Select value 
    From anime2
    CROSS APPLY STRING_SPLIT(Aired, '-')
	
	Select value, MAX(start_date)as date, count(*) as a
	From anime
	CROSS APPLY STRING_SPLIT(studios, '|')
	Where studios is not null
	GROUP BY value
	ORDER BY a DESC


	Select value, count(*) as count
	From anime
	CROSS APPLY STRING_SPLIT(studios, '|')
	GROUP BY value
	Having value is not null
	ORDER BY count DESC


	

-- CREATE VIEWS



-- Top popularity

Create View Top_popularity AS
Select title, genres,num_episodes,studios, popularity_rank , type
From anime
Where status = 'Finished Airing' AND popularity_rank <> 0



--  Top Score 
Create View top_score AS
Select title, genres,num_episodes,studios, score
From anime
Where status = 'Finished Airing'



--  Top Studios Avarage Score 
Create View studio_avarage AS
Select studios, AVG(CAST(score as float)) AS Avarage_score
From anime
Group by studios



--  Anime release chronology   
Create View anime_release AS
Select YEAR (start_date ) AS release_date, COUNT(start_date) AS anime_counter
From anime
Group by YEAR(start_date)



--  Top Anime dropped 

Create View anime_dropped AS
Select title, genres, dropped_count
From anime



-- Top tv series
    
	Create View top_tv_series AS
	Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'TV'

-- Top Movies 

   Create View top_movies AS
   Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'MOVIE'

-- Top OVAs
   
   Create View top_ova AS
   Select title, genres,num_episodes,studios, score
	From anime
	Where status = 'Finished Airing' AND type = 'OVA'
	

	ALTER View top_score AS
	Select title, genres,num_episodes,studios, CAST(score as FLOAT64) as score
	From anime
	Where status = 'Finished Airing'


