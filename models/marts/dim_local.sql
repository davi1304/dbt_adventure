with
    countryregion as (
        select *
        from {{ ref('stg_person_countryregion') }}
    ),

    stateprovince as (
        select *
        from {{ ref('stg_person_stateprovince') }}
    ),

    address as (
        select
            row_number() over (order by addressid) as address_sk
            , addressid
            , city
            , address.stateprovinceid as stateprovinceid
            , stateprovince.name as stateprovince_name
            , stateprovince.countryregioncode as countryregioncode
            , countryregion.name as countryregion_name
        from {{ ref('stg_person_address')}} as address
        left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
        left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode
)

select * from address
