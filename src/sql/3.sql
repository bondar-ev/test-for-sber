DROP TABLE IF EXISTS transfers;

CREATE TABLE transfers (
  from_account int,
  to_account int,
  amount int,
  tdate date
);

INSERT INTO transfers VALUES
(1, 2, 500, '2023-02-23'),
(2, 3, 300, '2023-03-01'),
(3, 1, 200, '2023-03-05'),
(1, 3, 400, '2023-04-05');

WITH balances AS (
  SELECT
    account,
    period,
    SUM(amount) OVER (PARTITION BY account ORDER BY period) AS balance
  FROM (
    SELECT
      from_account AS account,
      tdate AS period,
      -amount AS amount
    FROM transfers
    UNION ALL
    SELECT
      to_account AS account,
      tdate AS period,
      amount AS amount
    FROM transfers
  ) t
)
SELECT
  account AS acc,
  period AS dt_from,
  COALESCE(LEAD(period) OVER (PARTITION BY account ORDER BY period), '3000-01-01') AS dt_to,
  balance
FROM balances
WHERE balance <> 0
ORDER BY account, period;

DROP TABLE IF EXISTS transfers;