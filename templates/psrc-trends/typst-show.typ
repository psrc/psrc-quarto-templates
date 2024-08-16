#show: psrc-trend-report.with(
    $if(title)$
        title: "$title$",
    $endif$
    $if(params.trend_date)$
        trend_date: "$params.trend_date$",
    $endif$
)