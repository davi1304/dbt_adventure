with
    salesreason as (
        select *
        from {{ ref('stg_sales_salesorderheadersalesreason') }}
    )


    , reason as (
        select
            row_number() over (order by reason.salesreasonid) as salesreason_sk
            , reason.salesreasonid as reason_id
            , name
            , reasontype
            , salesreason.salesorderid
        from {{ ref('stg_sales_salesreason')}} as reason
        right join salesreason on reason.salesreasonid = salesreason.salesreasonid
)

select * from reason
