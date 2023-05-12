DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
  Date date
);

DECLARE @StartDate AS date;
SELECT @StartDate = GETDATE();

INSERT INTO dates (Date)
SELECT @StartDate;

DECLARE @i int = 1;
WHILE @i < 100
BEGIN
  DECLARE @LastDate date;
  SELECT @LastDate = MAX(Date) FROM dates;
  DECLARE @NewDate date;
  SELECT @NewDate = DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(6)+2,@LastDate);
  INSERT INTO dates (Date)
  SELECT @NewDate;
  SET @i = @i + 1;
END

SELECT CONVERT(varchar, Date, 104) AS Date FROM dates;

DROP TABLE IF EXISTS dates;