---------------------------------------------------------------------------------------------
-- suma total de despidos
select sum(total_laid_off) as total from layoffs;


---------------------------------------------------------------------------------------------
-- Empresas que mas veces despidieron
select company, count(total_laid_off) as amount
from layoffs
group by company
order by 2 desc;


---------------------------------------------------------------------------------------------
-- N° de despidos por Empresa
select company, sum(total_laid_off) as total, (percentage_laid_off*100) as percentage
from layoffs
where percentage_laid_off > 0
group by company
order by total desc
limit 10;


---------------------------------------------------------------------------------------------
-- N° de despidos por Industria
select industry, sum(total_laid_off) as total
from layoffs
group by industry
order by 2 desc


---------------------------------------------------------------------------------------------
-- N° de despidos por industria por mes
select industry, sum(total_laid_off) as total, month(date) as month
from layoffs
group by month(date), industry
order by 3 asc;


---------------------------------------------------------------------------------------------
-- N° de despidos por mes
select sum(total_laid_off) as total, month(date) as months
from layoffs
group by months
order by total desc;


---------------------------------------------------------------------------------------------
-- N° de despidos por Pais
select country, sum(total_laid_off) as total
from layoffs
group by country
order by total desc
limit 10;


---------------------------------------------------------------------------------------------
-- Paises donde no se han registrado despidos
select country
from layoffs
group by country
having sum(total_laid_off) = 0;


---------------------------------------------------------------------------------------------
-- Empresas donde no se han registrado despidos
select company
from layoffs
group by company
having sum(total_laid_off) = 0;
