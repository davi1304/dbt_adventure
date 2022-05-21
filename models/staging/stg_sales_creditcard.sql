with
    source_data as (
        select
            creditcardid
            , cardtype
        from {{ source('Adventureworks', 'sales_creditcard') }}
)

select *
from source_data