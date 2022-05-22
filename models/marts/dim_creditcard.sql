with
    creditcard as (
        select
            row_number() over (order by creditcardid) as creditcard_sk
            , creditcardid
            , cardtype
        from {{ ref('stg_sales_creditcard')}} as creditcard
)

select * from creditcard
