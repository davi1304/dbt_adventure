with
    source_data as (
        select
            salesorderid
            , status
            , customerid
            , shiptoaddressid
            , creditcardid
            , orderdate
        from {{ source('Adventureworks', 'sales_salesorderheader') }}
)

select *
from source_data