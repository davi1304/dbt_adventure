with
    reason as (
        select
            row_number() over (order by salesreasonid) as salesreason_sk
            , salesreasonid
            , name
            , reasontype
        from {{ ref('stg_sales_salesreason')}} as reason
)

select * from reason
