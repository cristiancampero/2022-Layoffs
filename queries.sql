---------------------------------------------------------------------------------------------
SELECT * FROM layoffs;


---------------------------------------------------------------------------------------------
-- Suma total de despedidos
SELECT SUM(total_laid_off) AS total_despedidos
FROM layoffs;


---------------------------------------------------------------------------------------------
-- Empresas que mas veces despidieron en el año
SELECT company AS empresa, COUNT(total_laid_off) AS cantidad
FROM layoffs
GROUP BY company
ORDER BY 2 DESC;


---------------------------------------------------------------------------------------------
-- Empresas que realizaron mas de un despido en un mismo mes
SELECT company AS empresa, monthname(str_to_date(date, '%d/%m/%Y')) AS mes, COUNT(total_laid_off) AS cantidad
FROM layoffs
GROUP BY empresa
HAVING COUNT(*) > 1
ORDER BY 3 DESC;


---------------------------------------------------------------------------------------------
-- N° de despedidos por Empresa
SELECT company AS empresa, SUM(total_laid_off) AS total, (percentage_laid_off*100) AS porcentaje
FROM layoffs
WHERE percentage_laid_off > 0
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;


---------------------------------------------------------------------------------------------
-- N° de despedidos por Industria
SELECT industry as industria, SUM(total_laid_off) AS total
FROM layoffs
GROUP BY industry
ORDER BY 2 DESC;


---------------------------------------------------------------------------------------------
-- Promedio de empleados despedidos por industria
SELECT industry, AVG(total_laid_off) AS 'Promedio de empleados despedidos'
FROM layoffs
GROUP BY MONTH(date), industry
ORDER BY 2 DESC;


---------------------------------------------------------------------------------------------
-- N° de despedidos por mes
SELECT SUM(total_laid_off) AS total, monthname(str_to_date(date, '%d/%m/%Y')) AS mes
FROM layoffs
GROUP BY mes
ORDER BY total DESC;


---------------------------------------------------------------------------------------------
-- Promedio de despedidos por mes
SELECT AVG(total_laid_off) AS 'Promedio de despedidos por mes'
FROM layoffs
GROUP BY MONTH(date);


---------------------------------------------------------------------------------------------
-- N° de despedidos por Pais
SELECT country AS pais, SUM(total_laid_off) AS total
FROM layoffs
GROUP BY pais
ORDER BY total DESC;


------------------------------------------------------
-- N° de despidos por mes y por Empresa
SELECT company AS Empresa, monthname(str_to_date(date, '%d/%m/%Y')) AS Mes, sum(total_laid_off) AS Total
FROM layoffs
GROUP BY Empresa, mes
ORDER BY Empresa, MONTH(str_to_date(mes, '%M')) ASC;


------------------------------------------------------
-- N° de despidos por mes y por país
SELECT country AS pais, monthname(str_to_date(date, '%d/%m/%Y')) AS mes, SUM(total_laid_off) AS total
FROM layoffs
GROUP BY pais, mes
ORDER BY pais, MONTH(str_to_date(mes, '%M')) ASC;


------------------------------------------------------
-- N° de despidos por mes y por industria
SELECT industry AS Industria, monthname(str_to_date(date, '%d/%m/%Y')) AS Mes, sum(total_laid_off) AS Total
FROM layoffs
GROUP BY industria, mes
ORDER BY industria, MONTH(str_to_date(mes, '%M')) ASC
