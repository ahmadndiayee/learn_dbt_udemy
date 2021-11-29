SELECT
    SUM(c_acctbal) as sum_c_acctbal
FROM 
     {{ ref('playing_with_tests') }}
HAVING 
    sum_c_acctbal > 100000000